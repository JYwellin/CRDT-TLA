--------------------------- MODULE CausalNetwork ---------------------------
EXTENDS Network, Naturals
-----------------------------------------------------------------------------
VARIABLES
    vc   \*   vc[r][s]: vector clock of replica s \in Replica at replica r \in Replica
    
-----------------------------------------------------------------------------    
initVector == [r \in Replica |-> 0]
-----------------------------------------------------------------------------
Init == /\ NInit
        /\ vc = [r \in Replica |-> initVector]

CBroadcast(r, m) == 
    /\ NBroadcast(r, m)
    /\ vc' = [vc EXCEPT ![r][r] = @ + 1]  
                   
CDeliver(r) == 
    /\ incoming[r] # EmptyBag
    /\ vc' = [vc EXCEPT ![r][r] = @ + 1]
    /\ \E m \in BagToSet(incoming[r]):         
         /\ \A s \in Replica:
              \/ m.ts[s] <= vc[r][s]
              \/ vc' = [vc EXCEPT ![r][s] = SetMax(@, m.ts[s])] 
         /\ msg' = [msg EXCEPT ![r] = m]
    /\ UNCHANGED <<incoming>>   
=============================================================================
\* Modification History
\* Last modified Mon May 20 17:11:03 CST 2019 by zfwang
\* Last modified Mon May 06 16:07:03 CST 2019 by jywellin
\* Last modified Wed Apr 17 17:47:27 CST 2019 by xhdn
\* Created Wed Mar 27 20:03:44 CST 2019 by jywellin
