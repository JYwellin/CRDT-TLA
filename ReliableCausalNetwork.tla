----------------------- MODULE ReliableCausalNetwork -----------------------
EXTENDS Network, Naturals
-----------------------------------------------------------------------------
VARIABLES
    vc
-----------------------------------------------------------------------------    
Vector == [Replica -> Nat]
InitVector == [r \in Replica |-> 0]
-----------------------------------------------------------------------------
RCInit == /\ NInit
          /\ vc = [r \in Replica |-> InitVector]

RCBroadcast(r, m) == /\ NBroadcast(r, m)
                     /\ vc' = [vc EXCEPT ![r][r] = @ + 1]  
                   
RCDeliver(r) == 
    /\ incoming[r] # EmptyBag
    /\ \E m \in BagToSet(incoming[r]): 
         /\ ~ IfDeliverMsg(m, r)
         /\ \A s \in Replica:
               \/ m.vc[s] <= vc[r][s]  
               \/ s = m.r 
         /\ m.vc[m.r] = vc[r][m.r] + 1
         /\ vc' = [vc EXCEPT ![r][m.r] = @ + 1]  
         /\ msg' =  m
    /\ UNCHANGED <<incoming, messageset>>    
=============================================================================
\* Modification History
\* Last modified Mon Jun 03 14:48:09 CST 2019 by xhdn
\* Last modified Mon May 06 16:07:42 CST 2019 by jywellin
\* Created Tue Apr 02 15:26:19 CST 2019 by jywellin
