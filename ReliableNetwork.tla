-------------------------- MODULE ReliableNetwork --------------------------
EXTENDS BasicNetwork
-----------------------------------------------------------------------------
rnVars == <<incoming, lmsg>>
-----------------------------------------------------------------------------
RNInit == BNInit

RNBroadcast(r, m) == BNBroadcast(r, m) 

RNDeliver(r) == 
    /\ incoming[r] # {}
    /\ \E m \in incoming[r]: 
        /\ lmsg' = [lmsg EXCEPT ![r] = m]  \* choose m from incoming[r] non-deterministically
        /\ incoming' = [incoming EXCEPT ![r] = @ \ {m}]  \* delete m 
=============================================================================
\* Modification History
\* Last modified Mon Jun 17 13:01:38 CST 2019 by xhdn
\* Last modified Mon May 06 15:22:12 CST 2019 by jywellin
\* Created Wed Mar 27 16:45:34 CST 2019 by jywellin