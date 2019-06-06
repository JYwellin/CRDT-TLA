------------------------------ MODULE Network ------------------------------
EXTENDS Bags, SystemModel
-----------------------------------------------------------------------------
VARIABLES msg
       
vars == <<incoming, msg>>
-----------------------------------------------------------------------------
TypeOK == SMTypeOK

NInit == 
    /\ incoming = [r \in Replica |-> EmptyBag]
    /\ msg = NotMsg

NBroadcast(r, m) == 
    /\ incoming' = [x \in Replica |->
                        IF x = r
                        THEN incoming[x]
                        ELSE incoming[x] (+) SetToBag({m}) ]                    
    /\ UNCHANGED <<msg>> 

NDeliver(r) == 
    /\ incoming[r] # EmptyBag
    /\ \E m \in BagToSet(incoming[r]):
         /\ msg' = m
    /\ UNCHANGED <<incoming>>                         
=============================================================================
\* Modification History
\* Last modified Thu Jun 06 15:58:34 CST 2019 by xhdn
\* Last modified Mon May 06 15:30:04 CST 2019 by jywellin
\* Created Mon Mar 25 20:24:02 CST 2019 by jywellin
