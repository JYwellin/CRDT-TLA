-------------------------- MODULE ReliableNetwork --------------------------
EXTENDS Network
-----------------------------------------------------------------------------
RInit == NInit

RBroadcast(r, m) == NBroadcast(r, m)

RDeliver(r) == 
    /\ incoming[r] # EmptyBag
    /\ \E m \in BagToSet(incoming[r]): ~ delivermsg(m, r)
             /\ msg' = [msg EXCEPT ![r] = m]
             /\ AddUpdate(r, m)
    /\ UNCHANGED <<incoming>>      
=============================================================================
\* Modification History
\* Last modified Sun Apr 28 14:17:02 CST 2019 by jywellin
\* Last modified Sun Apr 21 21:41:29 CST 2019 by xhdn
\* Created Wed Mar 27 16:45:34 CST 2019 by jywellin