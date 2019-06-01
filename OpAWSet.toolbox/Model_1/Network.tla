------------------------------ MODULE Network ------------------------------
EXTENDS Bags, Message
-----------------------------------------------------------------------------
VARIABLES
    incoming,
    msg
    
vars == <<incoming, msg>>
-----------------------------------------------------------------------------
CONSTANTS 
    Msg
    
NotMsg == CHOOSE m : m \notin Msg
-----------------------------------------------------------------------------
NInit == 
    /\ Minit
    /\ incoming = [r \in Replica |-> EmptyBag]
    /\ msg = NotMsg

NBroadcast(r, m) == 
    /\ incoming' = [x \in Replica |->
                        IF x = r
                        THEN incoming[x]
                        ELSE incoming[x] (+) SetToBag({m}) ]    
    /\ MBroadcast                  
    /\ UNCHANGED <<msg>> 

NDeliver(r) == 
    /\ incoming[r] # EmptyBag
    /\ \E m \in BagToSet(incoming[r]):
         /\ msg' = m
         /\ MDeliver(r, m)
    /\ UNCHANGED <<incoming>>                         
=============================================================================
\* Modification History
\* Last modified Sat Jun 01 20:22:29 CST 2019 by xhdn
\* Last modified Mon May 06 15:30:04 CST 2019 by jywellin
\* Created Mon Mar 25 20:24:02 CST 2019 by jywellin
