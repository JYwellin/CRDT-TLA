------------------------------- MODULE AWSet -------------------------------
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

vars == <<aSet, tSet, seq, incoming, msg, messageset, SECvars>>
----------------------------------------------------------------------------- 
Instance == [d: Data, r: Replica, k: Nat]
Msg == [r : Replica, seq : Nat, update : SUBSET Update, A: SUBSET Instance, T : SUBSET Instance]
----------------------------------------------------------------------------- 
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
-----------------------------------------------------------------------------
Broadcast(s, m) == 
    [r \in Replica |-> IF s = r THEN incoming[s] 
                                ELSE incoming[r] \o <<m>>]
                       
Send(r) == 
    /\ Network!NBroadcast(r, [r |-> r, seq |-> seq[r], update |-> StateUpdate(r), A |-> aSet[r], T |-> tSet[r]])  
    /\ SECSend(r)
    /\ UNCHANGED <<aSet, tSet, seq>>
           
Deliver(r) == 
    /\ Network!NDeliver(r)
    /\ SECDeliver(r, msg'[r])
    /\ seq' = [seq EXCEPT ![r] = @ + 1]
    /\ tSet' = [tSet EXCEPT ![r] = @ \cup msg'[r].T]
    /\ aSet' = [aSet EXCEPT ![r] = (@ \cup msg'[r].A) \ tSet'[r]]           
    /\ UNCHANGED <<>>                    
-----------------------------------------------------------------------------
Next ==
    \/ \E r \in Replica: \E a \in Data: 
        Add(a, r) \/ Remove(a, r)
    \/ \E r \in Replica: 
        Send(r) \/ Deliver(r)

Spec == Init /\ [][Next]_vars
-----------------------------------------------------------------------------
Read(r) == {ins.d: ins \in aSet[r]}

(* QC: Quiescent Consistency *)
Quiescence == 
    \A r \in Replica: incoming[r] = <<>>
    
Convergence == 
    \A r, s \in Replica: Read(r) = Read(s)

QC == Quiescence => Convergence

(* SEC: Strong Eventual Consistency *)
SEC == \A r1, r2 \in Replica :
        Sameupdate(r1, r2) => Read(r1) = Read(r2)
=============================================================================
\* Modification History
\* Last modified Mon May 13 13:28:35 CST 2019 by zfwang
\* Last modified Sun Apr 28 15:09:12 CST 2019 by jywellin
\* Created Sun Apr 28 14:02:54 CST 2019 by jywellin
