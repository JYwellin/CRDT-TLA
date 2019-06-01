--------------------------- MODULE CausalNetwork ---------------------------
EXTENDS Network, Naturals
-----------------------------------------------------------------------------
VARIABLES
    vc
-----------------------------------------------------------------------------    
vector == [Replica -> Nat]
initvector == [r \in Replica |-> 0]
-----------------------------------------------------------------------------
Init == /\ NInit
        /\ vc = [r \in Replica |-> initvector]

Broadcast(r, m) == /\ NBroadcast(r, m)
                   /\ vc' = [vc EXCEPT ![r][r] = @ + 1]  
                   
Deliver(r) == 
    /\ incoming[r] # EmptyBag
    /\ \E m \in BagToSet(incoming[r]):        
         /\ \A s \in Replica:
               \/ m.vc[s] <= vc[r][s]  
               \/ s # m.r 
         /\ m.vc[m.r] = vc[r][m.r] + 1
         /\ vc' = [vc EXCEPT ![r][m.r] = @ + 1]  
         /\ msg' = m
    /\ UNCHANGED <<incoming>>   
=============================================================================
\* Modification History
\* Last modified Sat Jun 01 20:26:45 CST 2019 by xhdn
\* Last modified Mon May 06 16:07:03 CST 2019 by jywellin
\* Created Wed Mar 27 20:03:44 CST 2019 by jywellin
