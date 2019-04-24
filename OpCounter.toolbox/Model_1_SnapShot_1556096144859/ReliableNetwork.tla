-------------------------- MODULE ReliableNetwork --------------------------
EXTENDS Network
-----------------------------------------------------------------------------
Init == NInit

Broadcast(r, m) == 
    /\ incoming' = [x \in Replica |->
                        IF x = r
                        THEN incoming[x]
                        ELSE incoming[r] (+) SetToBag({m})]
    /\ AddUpdate(r, m)                           
    /\ UNCHANGED <<msg>>

Deliver(r) == NDeliver(r)
=============================================================================
\* Modification History
\* Last modified Wed Apr 24 13:36:25 CST 2019 by jywellin
\* Last modified Sun Apr 21 21:41:29 CST 2019 by xhdn
\* Created Wed Mar 27 16:45:34 CST 2019 by jywellin