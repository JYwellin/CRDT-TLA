------------------------------- MODULE AWSet -------------------------------
EXTENDS Network, Naturals
-----------------------------------------------------------------------------
CONSTANTS
    Data      \* the set of data

Instance == [d: Data, r: Replica, k: Nat]

VARIABLES
    aSet,     \* aSet[r]: set of active Instance(s) maintained by r \in Replica
    tSet,     \* tSet[r]: set of tombstone Instance(s) maintained by r \in Replica
    seq,      \* seq[r]: local sequence number at replica r \in Replica
    incoming  \* incoming[r]: incoming messages at replica r \in Replica

vars == <<aSet, tSet, incoming, seq>>
-----------------------------------------------------------------------------    
TypeOK == 
    /\ aSet \in [Replica -> SUBSET Instance]
    /\ tSet \in [Replica -> SUBSET Instance]
    /\ incoming \in [Replica -> Seq([A : SUBSET Instance, T : SUBSET Instance])]
    /\ seq \in [Replica -> Nat]
-----------------------------------------------------------------------------
Init == 
    /\ aSet = [r \in Replica |-> {}]
    /\ tSet = [r \in Replica |-> {}]
    /\ seq = [r \in Replica |-> 0]
    /\ incoming = [r \in Replica |-> <<>>]          
-----------------------------------------------------------------------------
Add(d, r) == 
    /\ seq' = [seq EXCEPT ![r] = @ + 1]
    /\ aSet'= [aSet EXCEPT ![r] = @ \union {[d |-> d, r |-> r, k |-> seq'[r]]}]
    /\ UNCHANGED <<tSet, incoming>>

Remove(d, r) ==
    /\ LET D == {ins \in aSet[r] : ins.d = d}
       IN  /\ aSet' = [aSet EXCEPT ![r] = @ \ D]
           /\ tSet' = [tSet EXCEPT ![r] = @ \cup D] 
    /\ UNCHANGED <<seq, incoming>>
-----------------------------------------------------------------------------
Broadcast(s, m) == 
    [r \in Replica |-> IF s = r THEN incoming[s] 
                                ELSE incoming[r] \o <<m>>]
                       
Send(r) == 
    /\ incoming' = Broadcast(r, [A |-> aSet[r], T |-> tSet[r]])   
    /\ UNCHANGED <<aSet, tSet, seq>>
           
Deliver(r) == 
    /\ incoming[r] # <<>>
    /\ LET m == Head(incoming[r])
       IN  /\ tSet' = [tSet EXCEPT ![r] = @ \cup m.T]
           /\ aSet' = [aSet EXCEPT ![r] = (@ \cup m.A) \ tSet'[r]]    
    /\ incoming' = [incoming EXCEPT ![r] = Tail(@)]        
    /\ UNCHANGED <<seq>>                    
-----------------------------------------------------------------------------
Next ==
    \/ \E r \in Replica: \E a \in Data: 
        Add(a, r) \/ Remove(a, r)
    \/ \E r \in Replica: 
        Send(r) \/ Deliver(r)

Spec == Init /\ [][Next]_vars \* /\ WF_vars(Next)
-----------------------------------------------------------------------------
Read(r) == {ins.d: ins \in aSet[r]}

(* QC: Quiescent Consistency *)
Quiescence == 
    \A r \in Replica: incoming[r] = <<>>
    
Convergence == 
    \A r, s \in Replica: Read(r) = Read(s)

QC == Quiescence => Convergence


=============================================================================
\* Modification History
\* Last modified Sun Apr 28 15:09:12 CST 2019 by jywellin
\* Created Sun Apr 28 14:02:54 CST 2019 by jywellin
