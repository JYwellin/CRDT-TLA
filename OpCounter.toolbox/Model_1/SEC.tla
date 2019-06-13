-------------------------------- MODULE SEC --------------------------------
EXTENDS Naturals
-----------------------------------------------------------------------------
VARIABLES 
    updateset,
    new_updateset   
    
SECvars == <<updateset, new_updateset>>
-----------------------------------------------------------------------------
CONSTANTS 
    Replica
-----------------------------------------------------------------------------    
Uid == [r : Replica, seq : Nat]     \* Update Operation ID
-----------------------------------------------------------------------------  
OpUpdate(r) == new_updateset[r]     \* for op-based CRDT
StateUpdate(r) == updateset[r]      \* for state-based CRDT
-----------------------------------------------------------------------------
SECInit == 
    /\ updateset = [r \in Replica |-> {}]
    /\ new_updateset = [r \in Replica |-> {}]

SECUpdate(r, seq) == 
    /\ updateset' = [updateset EXCEPT ![r] = @ \cup { [r |-> r, seq |-> seq ] }] 
    /\ new_updateset' = [new_updateset EXCEPT ![r] = @ \cup { [r |-> r, seq |-> seq ] }] 

SECSend(r) ==
    /\ new_updateset' = [new_updateset EXCEPT ![r] = {}]
    /\ UNCHANGED <<updateset>> 
    
SECDeliver(r, m) ==
    /\ updateset' = [updateset EXCEPT ![r] = @ \cup m.update]    
    /\ UNCHANGED <<new_updateset>>  

(*    
SECFlush(r, seq) ==
    /\ updateset' = [updateset EXCEPT ![r] = @ \cup { [r |-> r, seq |-> seq ] }] 
    /\ prev_updateset' = [prev_updateset EXCEPT ![r] = @ \cup { [r |-> r, seq |-> seq ] }] 
*)
-----------------------------------------------------------------------------    
Sameupdate(r1, r2) == 
    updateset[r1] = updateset[r2]
=============================================================================
\* Modification History
\* Last modified Tue Jun 04 15:19:55 CST 2019 by xhdn
\* Last modified Mon May 06 16:50:42 CST 2019 by jywellin
\* Created Sun May 05 15:42:13 CST 2019 by jywellin
