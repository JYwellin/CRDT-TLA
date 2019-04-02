-------------------------- MODULE ReliableNetwork --------------------------
EXTENDS Bags
-----------------------------------------------------------------------------
CONSTANTS Replica
-----------------------------------------------------------------------------
VARIABLES
    incoming, msg
    
vars == <<incoming, msg>>
-----------------------------------------------------------------------------
Network == INSTANCE Network WITH  incoming <- incoming,msg <- msg
-----------------------------------------------------------------------------
TypeOK == /\ \A r \in Replica:IsABag(incoming[r])
-----------------------------------------------------------------------------
Init == Network!Init

Deliver(r) == Network!Deliver(r)

Broadcast(r, m)== /\ incoming' = [x \in Replica |->
                        IF x = r
                        THEN incoming[x]
                        ELSE incoming[x] (+) m]                            
                  /\ UNCHANGED <<msg>>
 -----------------------------------------------------------------------------
 EmptyChannel == Network!EmptyChannel
=============================================================================
\* Modification History
\* Last modified Tue Apr 02 15:19:56 CST 2019 by jywellin
\* Created Wed Mar 27 16:45:34 CST 2019 by jywellin
