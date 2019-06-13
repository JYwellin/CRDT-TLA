----------------------- MODULE ReliableCausalNetwork -----------------------
EXTENDS CausalNetwork, Message

RCvars == <<incoming, lmsg, dmsg, vc>>
-----------------------------------------------------------------------------
RCInit ==/\ CInit
         /\ MInit

RCBroadcast(r, m) == /\ CBroadcast(r, m)
                     /\ MBroadcast
                   
RCDeliver(r) == 
    /\ incoming[r] # EmptyBag
    /\ \E m \in BagToSet(incoming[r]): 
         /\ ~ IfDeliverMsg(m, r)
         /\ \A s \in Replica:
               \/ m.vc[s] <= vc[r][s]  
               \/ s = m.r 
         /\ m.vc[m.r] = vc[r][m.r] + 1
         /\ vc' = [vc EXCEPT ![r][m.r] = @ + 1]  
         /\ lmsg' =  m
         /\ MDeliver(r, m)
    /\ UNCHANGED <<incoming>>    
    
RCDo == UNCHANGED RCvars
=============================================================================
\* Modification History
\* Last modified Sat Jun 08 00:47:56 CST 2019 by xhdn
\* Last modified Mon May 06 16:07:42 CST 2019 by jywellin
\* Created Tue Apr 02 15:26:19 CST 2019 by jywellin
