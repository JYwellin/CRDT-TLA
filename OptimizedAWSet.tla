--------------------------- MODULE OptimizedAWSet ---------------------------
EXTENDS Naturals, Sequences
-----------------------------------------------------------------------------
CONSTANTS
    Data,
    Replica
    
VARIABLES
    aSet,
    seq,
    vc,
    incoming,  \* network variable
    msg,       \* network variable
    updateset  \* network variable

vars == <<aSet, seq, vc, incoming, msg, updateset>>
vector == [Replica -> Nat]
initvector == [r \in Replica |-> 0]
Msg == [r : Replica, seq : Nat, buf : Nat]
----------------------------------------------------------------------------- 
Network == INSTANCE Network
----------------------------------------------------------------------------- 
Instance == [d: Data, r: Replica, k: Nat]
-----------------------------------------------------------------------------    
TypeOK == 
    /\ Network!NInit
    /\ aSet \in [Replica -> SUBSET Instance]
    /\ seq \in [Replica -> Nat]
    /\ vc \in [Replica -> vector]
    
-----------------------------------------------------------------------------
Init == 
    /\ aSet = [r \in Replica |-> {}]
    /\ seq = [r \in Replica |-> 0]
    /\ vc = [r \in Replica |-> initvector]          
-----------------------------------------------------------------------------
Add(d, r) == 
    /\ seq' = [seq EXCEPT ![r] = @ + 1]
    /\ aSet'= [aSet EXCEPT ![r] = @ \union {[d |-> d, r |-> r, k |-> vc[r][r]+1]}]
    /\ vc' = [vc EXCEPT ![r][r] = @ + 1]
    /\ UNCHANGED <<incoming, msg, updateset>>

Remove(d, r) ==
    /\ LET D == {ins \in aSet[r] : ins.d = d}
       IN   aSet' = [aSet EXCEPT ![r] = @ \ D]
    /\ UNCHANGED <<seq, incoming>>
-----------------------------------------------------------------------------
Broadcast(s, m) == 
    [r \in Replica |-> IF s = r THEN incoming[s] 
                                ELSE incoming[r] \o <<m>>]
                       
Send(r) == 
    /\ incoming' = Broadcast(r, [A |-> aSet[r], T |-> tSet[r]])   
    /\ UNCHANGED <<aSet, seq>>
           
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
\* Last modified Sun Apr 28 21:57:17 CST 2019 by jywellin
\* Created Sun Apr 28 13:52:27 CST 2019 by jywellin
