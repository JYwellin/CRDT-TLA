----------------------- MODULE ReliableCausalNetwork -----------------------
EXTENDS Sequences
-----------------------------------------------------------------------------
CONSTANTS Replica
-----------------------------------------------------------------------------
VARIABLES
    incoming, msg
    
vars == <<incoming, msg>>
-----------------------------------------------------------------------------
CausalNetwork == INSTANCE CausalNetwork WITH  incoming <- incoming,msg <- msg
-----------------------------------------------------------------------------
Init == CausalNetwork!Init

Deliver(r) == CausalNetwork!Deliver(r)

Broadcast(r, m)== /\ incoming' = [x \in Replica |->
                        IF x = r
                        THEN incoming[x]
                        ELSE incoming[x] \o m]                            
                  /\ UNCHANGED <<msg>>
-----------------------------------------------------------------------------
 EmptyChannel == CausalNetwork!EmptyChannel
=============================================================================
\* Modification History
\* Last modified Tue Apr 02 15:28:07 CST 2019 by jywellin
\* Created Tue Apr 02 15:26:19 CST 2019 by jywellin
