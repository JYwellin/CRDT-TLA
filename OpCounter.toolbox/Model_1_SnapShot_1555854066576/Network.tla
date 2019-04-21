------------------------------ MODULE Network ------------------------------
EXTENDS Message, Bags
-----------------------------------------------------------------------------
CONSTANTS 
    Replica,
    Msg
    
NotMsg == CHOOSE m : m \notin Msg
-----------------------------------------------------------------------------
VARIABLES
    incoming,
    msg,
    updateset
    
vars == <<incoming, msg, updateset>>
-----------------------------------------------------------------------------
NInit == 
    /\ incoming = [r \in Replica |-> EmptyBag]
    /\ updateset = [r \in Replica |-> {}]
    /\ msg = [r \in Replica |-> NotMsg]

NBroadcast(r, m) == 
    /\ incoming' = [x \in Replica |->
                        IF x = r
                        THEN incoming[x]
                        ELSE \/ incoming[r] (+) SetToBag({m})
                             \/ incoming[r] (+) SetToBag({m}) (+) SetToBag({m})
                             \/ incoming[r]                                    ]
    /\ updateset' = [updateset EXCEPT ![r] = @ \cup {m}]                            
    /\ UNCHANGED <<msg>>

NDeliver(r) == 
    /\ incoming[r] # EmptyBag
    /\ \E m \in BagToSet(incoming[r]):
         /\ msg' = [msg EXCEPT ![r] = m]
         /\ updateset' = [updateset EXCEPT ![r] = @ (-) SetToBag({m})]
    /\ UNCHANGED <<incoming>>        
-----------------------------------------------------------------------------                          
EmptyChannel ==  
    incoming = [r \in Replica |-> EmptyBag]

Sameupdate(r1, r2) == 
    updateset[r2] = updateset[r2]

\* judge if two replicas receive the same set of update operations                      
=============================================================================
\* Modification History
\* Last modified Sun Apr 21 21:40:53 CST 2019 by xhdn
\* Last modified Tue Apr 16 17:31:52 CST 2019 by jywellin
\* Created Mon Mar 25 20:24:02 CST 2019 by jywellin
