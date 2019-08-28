------------------------------ MODULE StateSEC ------------------------------
EXTENDS Correctness
-----------------------------------------------------------------------------
StateSECInit ==  CInit   

StateSECDo(r) == CDo(r)  

StateSECSend(r) == 
    /\ CSend(r)
    /\ uincoming' = [x \in Replica |->  \* broadcast uset[r]
              IF x = r THEN uincoming[x]
                       ELSE uincoming[x] \cup {[aid |-> [r |->r, seq |-> seq[r]], update |-> delset[r]]} ]  
                                          
StateSECDeliver(r, aid) ==  CDeliver(r, aid)
=============================================================================
\* Modification History
\* Last modified Wed Aug 28 17:21:03 CST 2019 by xhdn
\* Created Tue Jun 11 17:33:04 CST 2019 by xhdn
