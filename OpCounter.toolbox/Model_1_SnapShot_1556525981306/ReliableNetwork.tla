-------------------------- MODULE ReliableNetwork --------------------------
EXTENDS Network
-----------------------------------------------------------------------------
RInit == NInit

RBroadcast(r, m) == NBroadcast(r, m)

RDeliver(r) == 
    /\ incoming[r] # EmptyBag
    /\ \E m \in BagToSet(incoming[r]): ~ IfDeliverMsg(m, r)
             /\ msg' = [msg EXCEPT ![r] = m]
             /\ DeliverMsg(r, m)
    /\ UNCHANGED <<incoming>>      
=============================================================================
\* Modification History
\* Last modified Mon Apr 29 16:01:34 CST 2019 by jywellin
\* Last modified Sun Apr 21 21:41:29 CST 2019 by xhdn
\* Created Wed Mar 27 16:45:34 CST 2019 by jywellin