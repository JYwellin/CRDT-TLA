-------------------------- MODULE ReliableNetwork --------------------------
EXTENDS Network
-----------------------------------------------------------------------------
RInit == NInit

RBroadcast(r, m) == NBroadcast(r, m)

RDeliver(r) == 
    /\ incoming[r] # EmptyBag
    /\ \E m \in BagToSet(incoming[r]): ~ IsDeliverMsg(m, r) 
        /\ msg' = [msg EXCEPT ![r] = m]
        /\ MDeliver(r, m)
    /\ UNCHANGED <<incoming>>      
=============================================================================
\* Modification History
\* Last modified Fri May 17 14:07:56 CST 2019 by zfwang
\* Last modified Mon May 06 15:22:12 CST 2019 by jywellin
\* Last modified Sun Apr 21 21:41:29 CST 2019 by xhdn
\* Created Wed Mar 27 16:45:34 CST 2019 by jywellin