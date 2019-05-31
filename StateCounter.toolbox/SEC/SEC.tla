-------------------------------- MODULE SEC --------------------------------
EXTENDS Naturals
-----------------------------------------------------------------------------
VARIABLES 
    updateSet,
    prev_updateSet   
    
SECvars == <<updateSet, prev_updateSet>>
-----------------------------------------------------------------------------
CONSTANTS 
    Replica
-----------------------------------------------------------------------------    
Update == [r : Replica, seq : Nat]
-----------------------------------------------------------------------------  
OpUpdate(r) == updateSet[r] \ prev_updateSet[r] \* for op-based CRDT
StateUpdate(r) == updateSet[r]                  \* for state-based CRDT
-----------------------------------------------------------------------------
SECInit == 
    /\ updateSet = [r \in Replica |-> {}]
    /\ prev_updateSet = [r \in Replica |-> {}]

SECUpdate(r, seq) == 
    /\ updateSet' = [updateSet EXCEPT ![r] = @ \cup { [r |-> r, seq |-> seq ] }] 
    /\ UNCHANGED <<prev_updateSet>>  

SECSend(r) ==
    /\ prev_updateSet' = [prev_updateSet EXCEPT ![r] = updateSet[r]]
    /\ UNCHANGED <<updateSet>> 
    
SECDeliver(r, m) ==
    /\ updateSet' = [updateSet EXCEPT ![r] = @ \cup m.update]    
    /\ prev_updateSet' = [prev_updateSet EXCEPT ![r] = @ \cup m.update]
-----------------------------------------------------------------------------    
SameUpdate(r1, r2) == updateSet[r1] = updateSet[r2]
=============================================================================
\* Modification History
\* Last modified Wed May 15 16:57:01 CST 2019 by zfwang
\* Last modified Mon May 06 16:50:42 CST 2019 by jywellin
\* Created Sun May 05 15:42:13 CST 2019 by jywellin
