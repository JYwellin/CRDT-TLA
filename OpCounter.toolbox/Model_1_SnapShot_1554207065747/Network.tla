------------------------------ MODULE Network ------------------------------
EXTENDS Bags
-----------------------------------------------------------------------------
CONSTANTS Replica
-----------------------------------------------------------------------------
VARIABLES
    incoming, msg
    
vars == <<incoming, msg>>
-----------------------------------------------------------------------------
TypeOK == /\ \A r \in Replica:IsABag(incoming[r])
-----------------------------------------------------------------------------
Init == /\ incoming = [r \in Replica |-> EmptyBag]
        /\ msg = [r \in Replica |-> 0]

Broadcast(r, m)== /\ incoming' = [x \in Replica |->
                        IF x = r
                        THEN incoming[x]
                        ELSE incoming[x] (+) m]                            
                  /\ UNCHANGED <<msg>>

Deliver(r) == /\ incoming[r] # EmptyBag
              /\  \E m \in BagToSet(incoming[r]):
                         (/\ incoming' = [incoming EXCEPT ![r] = @ (-) SetToBag({m})]
                          /\ msg' = [msg EXCEPT ![r] = m])   
                          
-----------------------------------------------------------------------------                          
EmptyChannel ==  incoming = [r \in Replica |-> EmptyBag]
                          
=============================================================================
\* Modification History
\* Last modified Tue Apr 02 20:10:47 CST 2019 by xhdn
\* Last modified Wed Mar 27 17:03:22 CST 2019 by jywellin
\* Created Mon Mar 25 20:24:02 CST 2019 by jywellin
