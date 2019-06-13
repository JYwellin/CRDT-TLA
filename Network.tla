------------------------------ MODULE Network ------------------------------
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
\* Last modified Sat Jun 08 00:45:32 CST 2019 by xhdn
\* Last modified Mon May 06 15:30:04 CST 2019 by jywellin
\* Created Mon Mar 25 20:24:02 CST 2019 by jywellin
