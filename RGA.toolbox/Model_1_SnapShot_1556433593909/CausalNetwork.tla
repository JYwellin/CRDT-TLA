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
         /\ msg' = [msg EXCEPT ![r] = m]
         /\ AddUpdate(r, m) 
         
=============================================================================
\* Modification History
\* Last modified Sun Apr 28 14:36:02 CST 2019 by jywellin
\* Last modified Wed Apr 17 17:47:27 CST 2019 by xhdn
\* Created Wed Mar 27 20:03:44 CST 2019 by jywellin
