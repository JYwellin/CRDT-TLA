-------------------------- MODULE ReliableNetwork --------------------------
EXTENDS Network
-----------------------------------------------------------------------------
Init == NInit

Broadcast(r, m) == 
    /\ incoming' = [x \in Replica |->
                        IF x = r
                        THEN incoming[x]
                        ELSE \/ incoming[r] (+) SetToBag({m})]
    /\ updateset' = [updateset EXCEPT ![r] = @ \cup {m}]                            
    /\ UNCHANGED <<msg>>

Deliver(r) == NDeliver(r)
=============================================================================
\* Modification History
\* Last modified Sun Apr 21 21:35:38 CST 2019 by xhdn
\* Last modified Mon Apr 15 14:04:16 CST 2019 by jywellin
\* Created Wed Mar 27 16:45:34 CST 2019 by jywellin