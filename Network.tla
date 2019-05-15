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
    /\ msg = [r \in Replica |-> NotMsg]

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
         /\ msg' = [msg EXCEPT ![r] = m]
         /\ MDeliver(r, m)
    /\ UNCHANGED <<incoming>>        
-----------------------------------------------------------------------------                          
EmptyChannel == incoming = [r \in Replica |-> EmptyBag]

\* judge if two replicas receive the same set of update operations                      
=============================================================================
\* Modification History
\* Last modified Wed May 15 16:52:45 CST 2019 by zfwang
\* Last modified Mon May 06 15:30:04 CST 2019 by jywellin
\* Last modified Sun Apr 21 21:44:03 CST 2019 by xhdn
\* Created Mon Mar 25 20:24:02 CST 2019 by jywellin
