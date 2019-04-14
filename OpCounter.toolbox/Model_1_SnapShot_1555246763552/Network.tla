------------------------------ MODULE Network ------------------------------
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
    /\ incoming = [r \in Replica |-> {}]
    /\ updateset = [r \in Replica |-> {}]
    /\ msg = [r \in Replica |-> NotMsg]

NBroadcast(r, m) == 
    /\ incoming' = [x \in Replica |->
                        IF x = r
                        THEN incoming[x]
                        ELSE incoming[x] \cup {m}]
    /\ updateset' = [updateset EXCEPT ![r] = @ \cup {m}]                            
    /\ UNCHANGED <<msg>>

NDeliver(r) == 
    /\ incoming[r] # {}
    /\ \E m \in incoming[r]:
        (/\ msg' = [msg EXCEPT ![r] = m]
         /\ updateset' = [updateset EXCEPT ![r] = @ \cup {m}])
    /\ UNCHANGED <<incoming>>        
-----------------------------------------------------------------------------                          
EmptyChannel ==  
    incoming = [r \in Replica |-> {}]

Sameupdate(r1, r2) == 
    updateset[r2] = updateset[r2]

\* judge if two replicas receive the same set of update operations                      
=============================================================================
\* Modification History
\* Last modified Sun Apr 14 20:56:27 CST 2019 by jywellin
\* Last modified Tue Apr 02 21:22:15 CST 2019 by xhdn
\* Created Mon Mar 25 20:24:02 CST 2019 by jywellin
