--------------------------- MODULE CausalNetwork ---------------------------
EXTENDS Network, Naturals
-----------------------------------------------------------------------------
VARIABLES
    vc
-----------------------------------------------------------------------------    
vector == [Replica -> Nat]
initVector == [r \in Replica |-> 0]
-----------------------------------------------------------------------------
Init == /\ NInit
        /\ vc = [r \in Replica |-> initVector]

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
    /\ UNCHANGED <<incoming>>   
=============================================================================
\* Modification History
\* Last modified Wed May 15 00:09:33 CST 2019 by zfwang
\* Last modified Mon May 06 16:07:03 CST 2019 by jywellin
\* Last modified Wed Apr 17 17:47:27 CST 2019 by xhdn
\* Created Wed Mar 27 20:03:44 CST 2019 by jywellin
