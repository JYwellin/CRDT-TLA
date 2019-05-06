----------------------- MODULE ReliableCausalNetwork -----------------------
EXTENDS ReliableNetwork, Naturals
-----------------------------------------------------------------------------
VARIABLES
    vc
-----------------------------------------------------------------------------    
vector == [Replica -> Nat]
initvector == [r \in Replica |-> 0]
-----------------------------------------------------------------------------
Init == /\ RInit
        /\ vc = [r \in Replica |-> initvector]

Broadcast(r, m) == /\ RBroadcast(r, m)
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
\* Last modified Mon May 06 16:07:42 CST 2019 by jywellin
\* Created Tue Apr 02 15:26:19 CST 2019 by jywellin
