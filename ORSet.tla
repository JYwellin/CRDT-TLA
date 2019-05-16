------------------------------- MODULE ORSet -------------------------------
EXTENDS Naturals, Sequences, Bags, TLC, SEC

CONSTANTS 
    Data      \* the set of data
    
Instance == [d: Data, r: Replica, k: Nat]
  
VARIABLES 
    sSet,     \* sSet[r]: set of active Instance(s) maintained by r \in Replica
    seq,      \* seq[r]: local sequence number at replica r \in Replic    
    incoming, \* incoming[r]: incoming messages at replica r \in Replica   
    msg,
    messageSet 

vars == <<sSet, seq, incoming, msg, messageSet, SECvars>>

Msg == [r : Replica, S: SUBSET Instance, seq : Nat, update : SUBSET Update]
-----------------------------------------------------------------------------
Network == INSTANCE ReliableNetwork
-----------------------------------------------------------------------------
TypeOK == 
    /\ sSet \in [Replica -> SUBSET Instance]
    /\ seq \in [Replica -> Nat]
-----------------------------------------------------------------------------
Init == 
    /\ sSet = [r \in Replica |-> {}]
    /\ seq = [r \in Replica |-> 0]    
    /\ Network!RInit
    /\ SECInit
-----------------------------------------------------------------------------
Add(d, r) == 
    /\ seq' = [seq EXCEPT ![r] = @ + 1]
    /\ sSet'= [sSet EXCEPT ![r] = @ \union {[d |-> d, r |-> r, k |-> seq'[r]]}]   
    /\ SECUpdate(r, seq[r])
    /\ UNCHANGED <<incoming, msg, messageSet>>

Remove(d, r) ==
    /\ LET D == {ins \in sSet[r] : ins.d = d}
       IN  sSet' = [sSet EXCEPT ![r] = @ \ D] 
    /\ seq' = [seq EXCEPT ![r] = @ + 1]
    /\ SECUpdate(r, seq[r])         
    /\ UNCHANGED <<incoming, msg, messageSet>> 
-----------------------------------------------------------------------------
Broadcast(s, m) == 
    [r \in Replica |-> IF s = r THEN incoming[s] 
                                ELSE incoming[r] (+) SetToBag({m})]
                                    
Send(r) == 
    /\ Network!RBroadcast(r, [r |-> r, S |-> sSet[r], seq |-> seq[r], 
       update|-> OpUpdate(r)])
    /\ SECSend(r) 
    /\ UNCHANGED <<sSet, seq>>
              
Receive(r) == 
    /\ Network!RDeliver(r)
    /\ SECDeliver(r, msg'[r])
    /\ sSet' = [sSet EXCEPT ![r] = @ \cup msg'[r].S]
    /\ UNCHANGED <<seq>>                
-----------------------------------------------------------------------------
Next ==
    \/ \E r \in Replica: \E a \in Data: 
        Add(a, r) \/ Remove(a, r)
    \/ \E r \in Replica: 
        Send(r) \/ Receive(r)

Spec == Init /\ [][Next]_vars
-----------------------------------------------------------------------------
Read(r) == {ins.d: ins \in sSet[r]}

(* QC: Quiescent Consistency *)
Quiescence == \A r \in Replica: incoming[r] = <<>>
    
Convergence == \A r, s \in Replica: Read(r) = Read(s)

QC == Quiescence => Convergence

(* SEC: Strong Eventual Consistency *)   
SEC == \A r1, r2 \in Replica : SameUpdate(r1, r2) => Read(r1) = Read(r2)
=============================================================================
\* Modification History
\* Last modified Thu May 16 10:34:44 CST 2019 by zfwang
\* Created Wed Feb 27 17:23:32 CST 2019 by zfwang
