-------------------------------- MODULE SEC --------------------------------
EXTENDS Naturals
-----------------------------------------------------------------------------
VARIABLES 
    updateset,
    last_updateset   
-----------------------------------------------------------------------------
CONSTANTS 
    Replica
-----------------------------------------------------------------------------    
Update == [r : Replica, seq : Nat]
-----------------------------------------------------------------------------  
OpUpdate(r) == updateset[r] \ last_updateset[r] \* for op-based CRDT
StateUpdate(r) == updateset[r]                  \* for state-based CRDT
-----------------------------------------------------------------------------
SECInit == 
    /\ updateset = [r \in Replica |-> {}]
    /\ last_updateset = [r \in Replica |-> {}]

SECUpdate(r, seq) == 
    /\ updateset' = [updateset EXCEPT ![r] = @ \cup { [r |-> r, seq |-> seq ] }] 
    /\ UNCHANGED <<last_updateset>>  
    
SECDeliver(r, m) ==
    /\ updateset' = [updateset EXCEPT ![r] = @ \cup m.update]    
    /\ last_updateset' = [last_updateset EXCEPT ![r] = @ \cup m.update]

SECSend(r) ==
    /\ last_updateset' = [last_updateset EXCEPT ![r] = updateset[r]]
    /\ UNCHANGED <<updateset>> 
-----------------------------------------------------------------------------    
Sameupdate(r1, r2) == 
    updateset[r1] = updateset[r2]
=============================================================================
\* Modification History
\* Last modified Mon May 06 15:41:02 CST 2019 by jywellin
\* Created Sun May 05 15:42:13 CST 2019 by jywellin
