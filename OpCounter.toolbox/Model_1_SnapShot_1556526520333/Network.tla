------------------------------ MODULE Network ------------------------------
EXTENDS Bags, Message
-----------------------------------------------------------------------------
VARIABLES
    incoming,
    msg
    
vars == <<incoming, msg, updateset>>
-----------------------------------------------------------------------------
CONSTANTS 
    Msg
    
NotMsg == CHOOSE m : m \notin Msg
-----------------------------------------------------------------------------
NInit == 
    /\ Minit
    /\ incoming = [r \in Replica |-> EmptyBag]
    /\ msg = [r \in Replica |-> NotMsg]

NBroadcast(r, m) == 
    /\ incoming' = [x \in Replica |->
                        IF x = r
                        THEN incoming[x]
                        ELSE incoming[r] (+) SetToBag({m}) ]
    /\ SendMsg(r)                          
    /\ UNCHANGED <<msg>>

NDeliver(r) == 
    /\ incoming[r] # EmptyBag
    /\ \E m \in BagToSet(incoming[r]):
         /\ msg' = [msg EXCEPT ![r] = m]
         /\ DeliverMsg(r, m)
    /\ UNCHANGED <<incoming>>        
-----------------------------------------------------------------------------                          
EmptyChannel ==  
    incoming = [r \in Replica |-> EmptyBag]

\* judge if two replicas receive the same set of update operations                      
=============================================================================
\* Modification History
\* Last modified Mon Apr 29 15:51:51 CST 2019 by jywellin
\* Last modified Sun Apr 21 21:44:03 CST 2019 by xhdn
\* Created Mon Mar 25 20:24:02 CST 2019 by jywellin
