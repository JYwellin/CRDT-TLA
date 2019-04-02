------------------------------ MODULE Network ------------------------------
CONSTANTS 
    Replica,
    Msg
    
NotMsg == CHOOSE m : m \notin Msg
-----------------------------------------------------------------------------
VARIABLES
    incoming, msg
    
vars == <<incoming, msg>>
-----------------------------------------------------------------------------
NInit == 
    /\ incoming = [r \in Replica |-> {}]
    /\ msg = [r \in Replica |-> NotMsg]

NBroadcast(r, m) == 
    /\ incoming' = [x \in Replica |->
                        IF x = r
                        THEN incoming[x]
                        ELSE incoming[x] \cup {m}]                            
    /\ UNCHANGED <<msg>>

NDeliver(r) == 
    /\ incoming[r] # {}
    /\ \E m \in incoming[r]:
        msg' = [msg EXCEPT ![r] = m]
    /\ UNCHANGED <<incoming>>        
-----------------------------------------------------------------------------                          
EmptyChannel ==  
    incoming = [r \in Replica |-> {}]                      
=============================================================================
\* Modification History
\* Last modified Tue Apr 02 21:22:15 CST 2019 by xhdn
\* Last modified Wed Mar 27 17:03:22 CST 2019 by jywellin
\* Created Mon Mar 25 20:24:02 CST 2019 by jywellin
