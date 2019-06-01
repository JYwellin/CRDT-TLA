-------------------------------- MODULE SEC --------------------------------
EXTENDS Naturals
-----------------------------------------------------------------------------
VARIABLES 
    updateset,
    prev_updateset   
    
SECvars == <<updateset, prev_updateset>>
-----------------------------------------------------------------------------
CONSTANTS 
    Replica
-----------------------------------------------------------------------------    
Update == [r : Replica, seq : Nat]
-----------------------------------------------------------------------------  
OpUpdate(r) == updateset[r] \ prev_updateset[r] \* for op-based CRDT
StateUpdate(r) == updateset[r]                  \* for state-based CRDT
-----------------------------------------------------------------------------
SECInit == 
    /\ updateset = [r \in Replica |-> {}]
    /\ prev_updateset = [r \in Replica |-> {}]

SECUpdate(r, seq) == 
    /\ updateset' = [updateset EXCEPT ![r] = @ \cup { [r |-> r, seq |-> seq ] }] 
    /\ UNCHANGED <<prev_updateset>>  

SECSend(r) ==
    /\ prev_updateset' = [prev_updateset EXCEPT ![r] = updateset[r]]
    /\ UNCHANGED <<updateset>> 
    
SECDeliver(r, m) ==
    /\ updateset' = [updateset EXCEPT ![r] = @ \cup m.update]    
    /\ prev_updateset' = [prev_updateset EXCEPT ![r] = @ \cup m.update]
-----------------------------------------------------------------------------    
Sameupdate(r1, r2) == 
    updateset[r1] = updateset[r2]
=============================================================================
\* Modification History
\* Last modified Fri May 31 20:28:21 CST 2019 by xhdn
\* Last modified Mon May 06 16:50:42 CST 2019 by jywellin
\* Created Sun May 05 15:42:13 CST 2019 by jywellin
