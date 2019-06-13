-------------------------------- MODULE SEC --------------------------------
EXTENDS Naturals
CONSTANTS 
    Replica,
    Read(_, _)
    
Aid == [r : Replica, seq : Nat]                       \*action ID
UMsg == [r : Replica, seq : Nat, update: SUBSET Aid]  \*SEC message type   
-----------------------------------------------------------------------------
VARIABLES 
    updateset,  \*updateset[r]£º
    data,
    uincoming   \* uincoming[r]£ºupdate incoming channel for r \in Replica
-----------------------------------------------------------------------------
SECTypeOK ==
    /\ updateset \in [Replica -> SUBSET Aid]
    /\ uincoming \in [Replica -> SUBSET UMsg]
    
SECInit ==  \*initial state
     /\ updateset = [r \in Replica |-> {}]
     /\ uincoming = [r \in Replica |-> {}]
    
SECUpdate(r, seq) == 
     /\ updateset' = [updateset EXCEPT ![r] = @ \cup { [r |-> r, seq |-> seq ] }]
     /\ UNCHANGED <<uincoming>>

SECSend(r) == UNCHANGED <<updateset>>
       
SECDeliver(r, u) == 
    /\ updateset' = [updateset EXCEPT ![r] = @ \cup u] 
    /\ UNCHANGED <<uincoming>>
-----------------------------------------------------------------------------   
SearchMsg(set, id) ==  CHOOSE m \in set : m.seq = id.seq /\ m.r = id.r     \*Find the message in set
 
Sameupdate(r1, r2) == 
    updateset[r1] = updateset[r2]

SEC == \A r1, r2 \in Replica : Sameupdate(r1, r2) => Read(r1, data[r1]) = Read(r2, data[r2])
=============================================================================
\* Modification History
\* Last modified Thu Jun 13 21:15:02 CST 2019 by xhdn
\* Last modified Mon May 06 16:50:42 CST 2019 by jywellin
\* Created Sun May 05 15:42:13 CST 2019 by jywellin
