------------------------------- MODULE OpSEC -------------------------------
EXTENDS Correctness
-----------------------------------------------------------------------------
VARIABLES buset  \* buset[r]: the buffer of local updates made by r \in Replica since the last broadcast     
-----------------------------------------------------------------------------
OpSECInit ==
    /\ CInit
    /\ buset = [r \in Replica |-> {}]

OpSECDo(r) == 
    /\CDo(r)                             
    /\buset' = [buset EXCEPT ![r] = @ \cup {[r |-> r, seq |-> seq[r]]}]  \*collect a new update
    
OpSECSend(r) == 
    /\ CSend(r)
    /\ uincoming' = [x \in Replica |->     \* broadcast buset[r]
               IF x = r THEN uincoming[x]
                        ELSE uincoming[x] \cup {[aid |-> [r |-> r, seq |-> seq[r]], update |-> buset[r]]} ]  
    /\ buset' = [buset EXCEPT ![r] = {} ]  \* clear buset[r]
                    
OpSECDeliver(r, aid) ==
    /\  CDeliver(r, aid) 
    /\  UNCHANGED <<buset>>
=============================================================================
\* Modification History
\* Last modified Wed Aug 28 17:21:48 CST 2019 by xhdn
\* Created Tue Jun 11 17:32:49 CST 2019 by xhdn
