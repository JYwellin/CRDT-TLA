-------------------------- MODULE ReliableNetwork --------------------------
EXTENDS Network
-----------------------------------------------------------------------------
RInit == NInit

RBroadcast(r, m) == NBroadcast(r, m)

RDeliver(r) == 
    /\ incoming[r] # EmptyBag
    /\ \E m \in BagToSet(incoming[r]):
        /\ ~ IfDeliverMsg(m, r) 
        /\ msg' = m
        /\ MDeliver(r, m)
    /\ UNCHANGED <<incoming>>      
=============================================================================
\* Modification History
\* Last modified Sat Jun 01 20:25:43 CST 2019 by xhdn
\* Last modified Mon May 06 15:22:12 CST 2019 by jywellin
\* Created Wed Mar 27 16:45:34 CST 2019 by jywellin