-------------------------- MODULE ReliableNetwork --------------------------
EXTENDS Network
-----------------------------------------------------------------------------
Init == NInit

Broadcast(r, m) == NBroadcast(r, m)

Deliver(r) == 
    /\ incoming[r] # {}
    /\ \E m \in incoming[r]:
        (/\ msg' = [msg EXCEPT ![r] = m]
         /\ incoming' = [incoming EXCEPT ![r] = @ \ {m}]
         /\ updateset' = [updateset EXCEPT ![r] = @ \cup {m}])
=============================================================================
\* Modification History
\* Last modified Sun Apr 14 20:52:25 CST 2019 by jywellin
\* Last modified Tue Apr 02 20:57:30 CST 2019 by xhdn
\* Created Wed Mar 27 16:45:34 CST 2019 by jywellin