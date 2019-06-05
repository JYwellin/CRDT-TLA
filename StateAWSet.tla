----------------------------- MODULE StateAWSet -----------------------------
EXTENDS Naturals, Sequences, SEC
-----------------------------------------------------------------------------
CONSTANTS
    Data      \* the set of data

VARIABLES
    aSet,     \* aSet[r]: set of active Instance(s) maintained by r \in Replica
    tSet,     \* tSet[r]: set of tombstone Instance(s) maintained by r \in Replica
    seq,      \* seq[r]: local sequence number at replica r \in Replica
    incoming, \* incoming[r]: incoming messages at replica r \in Replica
    msg,
    messageset

NETvars == <<incoming, msg, messageset>>
vars == <<aSet, tSet, seq, NETvars, SECvars>>
----------------------------------------------------------------------------- 
Instance == [d: Data, r: Replica, k: Nat]
Msg == [r : Replica, seq : Nat, update : SUBSET Uid, A: SUBSET Instance, T : SUBSET Instance]
----------------------------------------------------------------------------- 
(**********************************************************************)
(* Any Network                                                        *)
(**********************************************************************)
Network == INSTANCE Network
-----------------------------------------------------------------------------    
TypeOK == 
    /\ aSet \in [Replica -> SUBSET Instance]
    /\ tSet \in [Replica -> SUBSET Instance]
    /\ seq \in [Replica -> Nat]
-----------------------------------------------------------------------------
Init == 
    /\ Network!NInit
    /\ SECInit
    /\ seq = [r \in Replica |-> 0]
    /\ aSet = [r \in Replica |-> {}]
    /\ tSet = [r \in Replica |-> {}]        
-----------------------------------------------------------------------------                      
Send(r) == 
    /\ Network!NBroadcast(r, [r |-> r, seq |-> seq[r], update |-> StateUpdate(r), A |-> aSet[r], T |-> tSet[r]])  
    /\ SECSend(r)
    /\ UNCHANGED <<aSet, tSet, seq>>
           
Receive(r) == 
    /\ Network!NDeliver(r)
    /\ SECDeliver(r, msg'[r])
    /\ seq' = [seq EXCEPT ![r] = @ + 1]
    /\ tSet' = [tSet EXCEPT ![r] = @ \cup msg'[r].T]
    /\ aSet' = [aSet EXCEPT ![r] = (@ \cup msg'[r].A) \ tSet'[r]]           
    /\ UNCHANGED <<>> 
-----------------------------------------------------------------------------
Add(d, r) == 
    /\ seq' = [seq EXCEPT ![r] = @ + 1]
    /\ SECUpdate(r, seq[r])
    /\ aSet'= [aSet EXCEPT ![r] = @ \union {[d |-> d, r |-> r, k |-> seq'[r]]}]
    /\ UNCHANGED <<tSet, incoming, msg, messageset>>

Remove(d, r) ==
    /\ seq' = [seq EXCEPT ![r] = @ + 1]
    /\ SECUpdate(r, seq[r])
    /\ LET D == {ins \in aSet[r] : ins.d = d}
       IN  /\ aSet' = [aSet EXCEPT ![r] = @ \ D]
           /\ tSet' = [tSet EXCEPT ![r] = @ \cup D] 
    /\ UNCHANGED <<incoming, msg, messageset>>
                      
Update(r) ==  \E a \in Data: 
                 Add(a, r) \/ Remove(a, r)         
-----------------------------------------------------------------------------
Next == 
    \E r \in Replica: 
        Receive(r) \/ Send(r) \/ Update(r)

Spec == Init /\ [][Next]_vars
-----------------------------------------------------------------------------
Read(r) == {ins.d: ins \in aSet[r]}

(* SEC: Strong Eventual Consistency *)
SEC == \A r1, r2 \in Replica :
        Sameupdate(r1, r2) => Read(r1) = Read(r2)
=============================================================================
\* Modification History
\* Last modified Tue Jun 04 17:50:15 CST 2019 by xhdn
\* Created Fri May 24 14:13:38 CST 2019 by xhdn
