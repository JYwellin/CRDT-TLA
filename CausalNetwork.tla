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
    /\ incoming[r] # {}
    /\ \E m \in incoming[r]:        
         /\ \A s \in Replica:
               \/ m.vc[s] <= vc[r][s]  
               \/ s # m.r 
         /\ m.vc[m.r] = vc[r][m.r] + 1
         /\ vc' = [vc EXCEPT ![r][m.r] = @ + 1]  
         /\ msg' = [msg EXCEPT ![r] = m]
         /\ incoming' = [incoming EXCEPT ![r] = @ \ {m}]
         /\ AddUpdate(r, m) 
         
=============================================================================
\* Modification History
\* Last modified Wed Apr 24 17:59:35 CST 2019 by jywellin
\* Last modified Wed Apr 17 17:47:27 CST 2019 by xhdn
\* Created Wed Mar 27 20:03:44 CST 2019 by jywellin
