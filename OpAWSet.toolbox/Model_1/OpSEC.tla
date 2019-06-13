------------------------------- MODULE OpSEC -------------------------------
EXTENDS SEC
-----------------------------------------------------------------------------
VARIABLES 
    new_updateset  \* new_update[r]:     
-----------------------------------------------------------------------------
OpSECInit ==   \* initial state
    /\ SECInit
    /\ new_updateset = [r \in Replica |-> {}]

OpSECUpdate(r, seq) == 
    /\ SECUpdate(r, seq) 
    /\ new_updateset' = [new_updateset EXCEPT ![r] = @ \cup { [r |-> r, seq |-> seq ] }]
    
OpSECSend(r, seq) == 
    /\ SECSend(r)
    /\ uincoming' = [x \in Replica |->
                        IF x = r
                        THEN uincoming[x]
                        ELSE uincoming[x] \cup {[r |-> r, seq |->seq, update |-> new_updateset[r]]} ]  
    /\ new_updateset' = [new_updateset EXCEPT ![r] = {} ]
                    
OpSECDeliver(r, aid) ==
    /\  SECDeliver(r, SearchMsg(uincoming[r], aid).update)  
    /\  UNCHANGED <<new_updateset>>
=============================================================================
\* Modification History
\* Last modified Thu Jun 13 17:03:15 CST 2019 by xhdn
\* Created Tue Jun 11 17:32:49 CST 2019 by xhdn
