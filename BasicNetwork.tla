---------------------------- MODULE BasicNetwork ----------------------------
EXTENDS Bags, SystemModel
-----------------------------------------------------------------------------
VARIABLES lmsg
       
Nvars  == <<incoming, lmsg>>
-----------------------------------------------------------------------------
NInit == 
    /\ incoming = [r \in Replica |-> EmptyBag]
    /\ lmsg = NotMsg

NBroadcast(r, m) == 
    /\ incoming' = [x \in Replica |->
                        IF x = r
                        THEN incoming[x]
                        ELSE incoming[x] (+) SetToBag({m}) ]                    
    /\ UNCHANGED <<lmsg>> 

NDeliver(r) == 
    /\ incoming[r] # EmptyBag
    /\ \E m \in BagToSet(incoming[r]):
         /\ lmsg' = m
    /\ UNCHANGED <<incoming>> 
    
NDo == UNCHANGED Nvars  
=============================================================================
\* Modification History
\* Last modified Sun Jun 09 20:28:01 CST 2019 by xhdn
\* Created Sun Jun 09 20:27:37 CST 2019 by xhdn
