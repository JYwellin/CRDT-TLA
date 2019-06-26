------------------------------- MODULE OpSEC -------------------------------
EXTENDS SEC
-----------------------------------------------------------------------------
VARIABLES buset  \* buset[r]: the buffer of local updates made by r \in Replica since the last broadcast     
-----------------------------------------------------------------------------
OpSECInit ==
    /\ SECInit
    /\ buset = [r \in Replica |-> {}]

OpSECDo(r) == 
    /\SECDo(r)                             
    /\buset' = [buset EXCEPT ![r] = @ \cup {[r |-> r, seq |-> seq[r]]}]  \*collect a new update
    
OpSECSend(r) == 
    /\ SECSend(r)
    /\ uincoming' = [x \in Replica |->     \* broadcast buset[r]
               IF x = r THEN uincoming[x]
                        ELSE uincoming[x] \cup {[aid |-> [r |-> r, seq |-> seq[r]], update |-> buset[r]]} ]  
    /\ buset' = [buset EXCEPT ![r] = {} ]  \* clear buset[r]
                    
OpSECDeliver(r, aid) ==
    /\  SECDeliver(r, aid) 
    /\  UNCHANGED <<buset>>
=============================================================================
\* Modification History
\* Last modified Wed Jun 26 13:21:02 CST 2019 by xhdn
\* Created Tue Jun 11 17:32:49 CST 2019 by xhdn
