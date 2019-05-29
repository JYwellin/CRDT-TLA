----------------------- MODULE ReliableCausalNetwork -----------------------
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
    /\ \E m \in BagToSet(incoming[r]): ~ IfDeliverMsg(m, r)
         /\ \A s \in Replica:
               \/ m.vc[s] <= vc[r][s]  
               \/ s # m.r 
         /\ m.vc[m.r] = vc[r][m.r] + 1
         /\ vc' = [vc EXCEPT ![r][m.r] = @ + 1]  
         /\ msg' = [msg EXCEPT ![r] = m]
    /\ UNCHANGED <<incoming>>  
         
=============================================================================
\* Modification History
\* Last modified Wed May 29 21:04:25 CST 2019 by xhdn
\* Last modified Mon May 06 16:07:42 CST 2019 by jywellin
\* Created Tue Apr 02 15:26:19 CST 2019 by jywellin
