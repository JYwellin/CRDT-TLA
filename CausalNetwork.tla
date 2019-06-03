--------------------------- MODULE CausalNetwork ---------------------------
EXTENDS Network, Naturals
-----------------------------------------------------------------------------
VARIABLES
    vc
-----------------------------------------------------------------------------    
vector == [Replica -> Nat]
initvector == [r \in Replica |-> 0]
-----------------------------------------------------------------------------
CInit == /\ NInit
        /\ vc = [r \in Replica |-> initvector]

CBroadcast(r, m) == /\ NBroadcast(r, m)
                   /\ vc' = [vc EXCEPT ![r][r] = @ + 1]  
                   
CDeliver(r) == 
    /\ incoming[r] # EmptyBag
    /\ \E m \in BagToSet(incoming[r]):        
         /\ \A s \in Replica:
               \/ m.vc[s] <= vc[r][s]  
               \/ s = m.r 
         /\ m.vc[m.r] >= vc[r][m.r]
         /\ vc' = [vc EXCEPT ![r][m.r] = m.vc[m.r]]  
         /\ msg' = m
    /\ UNCHANGED <<incoming, messageset>>   
=============================================================================
\* Modification History
\* Last modified Mon Jun 03 15:13:25 CST 2019 by xhdn
\* Last modified Mon May 06 16:07:03 CST 2019 by jywellin
\* Created Wed Mar 27 20:03:44 CST 2019 by jywellin
