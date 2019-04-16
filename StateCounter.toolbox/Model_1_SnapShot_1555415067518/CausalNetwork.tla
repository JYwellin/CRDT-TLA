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
         /\ m.vc[m.r] = vc[r][m.r] + 1
         /\ \A s \in Replica: 
              \/  /\ s # m.r
                  /\ m.vc[s] <= vc[r][s]   
              \/  s = m.r
         /\ vc' = [vc EXCEPT ![r][m.r] = @ + 1]  
         /\ msg' = [msg EXCEPT ![r] = m]
         /\ incoming' = [incoming EXCEPT ![r] = @ \ {m}]
         /\ updateset' = [updateset EXCEPT ![r] = @ \cup {m}] 
         
=============================================================================
\* Modification History
\* Last modified Tue Apr 16 19:40:44 CST 2019 by jywellin
\* Created Wed Mar 27 20:03:44 CST 2019 by jywellin
