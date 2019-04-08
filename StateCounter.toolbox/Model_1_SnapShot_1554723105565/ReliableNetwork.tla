-------------------------- MODULE ReliableNetwork --------------------------
EXTENDS Network
-----------------------------------------------------------------------------
Init == NInit

Broadcast(r, m) == NBroadcast(r, m)

Deliver(r) == 
    /\ incoming[r] # {}
    /\ \E m \in incoming[r]:
        /\ msg' = [msg EXCEPT ![r] = m]
        /\ incoming' = [incoming EXCEPT ![r] = @ \ {m}]
=============================================================================
\* Modification History
\* Last modified Tue Apr 02 20:57:30 CST 2019 by xhdn
\* Last modified Tue Apr 02 15:19:56 CST 2019 by jywellin
\* Created Wed Mar 27 16:45:34 CST 2019 by jywellin