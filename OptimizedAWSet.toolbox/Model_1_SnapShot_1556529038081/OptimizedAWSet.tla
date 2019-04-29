--------------------------- MODULE OptimizedAWSet ---------------------------
EXTENDS Naturals, Sequences, Message
-----------------------------------------------------------------------------
CONSTANTS
    Data
    
VARIABLES
    aSet,
    seq,
    vc,
    incoming,  \* network variable
    msg        \* network variable

vars == <<aSet, seq, vc, incoming, msg, updateset, last_updateset, messageset>>
----------------------------------------------------------------------------- 
Vector == [Replica -> Nat]
Initvector == [r \in Replica |-> 0]
Instance == [d: Data, r: Replica, k: Nat]
Msg == [r : Replica, seq : Nat, vc: Vector, update : SUBSET Update, A: SUBSET Instance]
----------------------------------------------------------------------------- 
Network == INSTANCE Network
-----------------------------------------------------------------------------    
TypeOK == 
    /\ aSet \in [Replica -> SUBSET Instance]
    /\ seq \in [Replica -> Nat]
    /\ vc \in [Replica -> Vector]    
-----------------------------------------------------------------------------
Init == 
    /\ Network!NInit
    /\ aSet = [r \in Replica |-> {}]
    /\ seq = [r \in Replica |-> 0]
    /\ vc = [r \in Replica |-> Initvector]          
-----------------------------------------------------------------------------
Add(d, r) == 
    /\ seq' = [seq EXCEPT ![r] = @ + 1]
    /\ AddUpdate(r, seq[r])
    /\ LET D == {ins \in aSet[r] : ins.d = d}
       IN aSet'= [aSet EXCEPT ![r] = (@ \cup {[d |-> d, r |-> r, k |-> vc[r][r]+1]}) \D]
    /\ vc' = [vc EXCEPT ![r][r] = @ + 1]
    /\ UNCHANGED <<incoming, msg>>

Remove(d, r) ==
    /\ seq' = [seq EXCEPT ![r] = @ + 1]
    /\ AddUpdate(r, seq[r])
    /\ LET D == {ins \in aSet[r] : ins.d = d}
       IN   aSet' = [aSet EXCEPT ![r] = @ \ D]
    /\ UNCHANGED <<vc, incoming, msg>>
-----------------------------------------------------------------------------
Send(r) == 
    /\ Network!NBroadcast(r, [r |-> r, seq |-> seq[r], update |-> StateUpdate(r), vc|-> vc[r], A|-> aSet[r] ])  
    /\ UNCHANGED <<aSet, seq, vc>>
    
SetMax(r, s) == IF r > s THEN r ELSE s      
    
Deliver(r) == 
    /\ Network!NDeliver(r)
    /\ LET Diff1 == {ins \in aSet[r]   : ~ ins \in msg[r]'.A}
           Diff2 == {ins \in msg[r]'.A : ~ ins \in aSet[r]  }
           D1 == {ins \in Diff1 : ins.k <= msg[r]'.vc[r]}
           D2 == {ins \in Diff2 : ins.k <= vc[r][r]}
           Alocal == aSet[r] \ D1
           Aremote == msg[r]'.A \ D2
       IN  aSet' = [aSet EXCEPT ![r] = Alocal \cup Aremote]    
    /\ \A s \in Replica : vc' = [vc EXCEPT ![r][s] = SetMax(@, msg'[r].vc[s])]         
    /\ UNCHANGED <<seq, vc>>                    
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

SEC == \A r1, r2 \in Replica : Sameupdate(r1, r2)
            => Convergence
=============================================================================
\* Modification History
\* Last modified Mon Apr 29 17:07:53 CST 2019 by jywellin
\* Created Sun Apr 28 13:52:27 CST 2019 by jywellin
