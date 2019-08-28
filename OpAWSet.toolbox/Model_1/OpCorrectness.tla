--------------------------- MODULE OpCorrectness ---------------------------
EXTENDS Correctness
-----------------------------------------------------------------------------
VARIABLES buset  \* buset[r]: the buffer of local updates made by r \in Replica since the last broadcast     
-----------------------------------------------------------------------------
OpCInit ==
    /\ CInit
    /\ buset = [r \in Replica |-> {}]

OpCDo(r) == 
    /\CDo(r)                             
    /\buset' = [buset EXCEPT ![r] = @ \cup {[r |-> r, seq |-> seq[r]]}]  \*collect a new update
    
OpCSend(r) == 
    /\ CSend(r)
    /\ uincoming' = [x \in Replica |->     \* broadcast buset[r]
               IF x = r THEN uincoming[x]
                        ELSE uincoming[x] \cup {[aid |-> [r |-> r, seq |-> seq[r]], update |-> buset[r]]} ]  
    /\ buset' = [buset EXCEPT ![r] = {} ]  \* clear buset[r]
                    
OpCDeliver(r, aid) ==
    /\  CDeliver(r, aid) 
    /\  UNCHANGED <<buset>>
=============================================================================
\* Modification History
\* Last modified Wed Aug 28 19:24:39 CST 2019 by xhdn
\* Created Wed Aug 28 19:24:11 CST 2019 by xhdn
