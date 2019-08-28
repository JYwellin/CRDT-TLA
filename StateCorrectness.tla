-------------------------- MODULE StateCorrectness --------------------------
EXTENDS Correctness
-----------------------------------------------------------------------------
StateCInit ==  CInit   

StateCDo(r) == CDo(r)  

StateCSend(r) == 
    /\ CSend(r)
    /\ uincoming' = [x \in Replica |->  \* broadcast delset[r]
              IF x = r THEN uincoming[x]
                       ELSE uincoming[x] \cup {[aid |-> [r |->r, seq |-> seq[r]], update |-> delset[r]]} ]  
                                          
StateCDeliver(r, aid) ==  CDeliver(r, aid)
=============================================================================
\* Modification History
\* Last modified Wed Aug 28 19:25:47 CST 2019 by xhdn
\* Created Wed Aug 28 19:25:16 CST 2019 by xhdn
