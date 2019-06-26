------------------------------ MODULE StateSEC ------------------------------
EXTENDS SEC
-----------------------------------------------------------------------------
StateSECInit ==  SECInit   

StateSECDo(r) == SECDo(r)  

StateSECSend(r) == 
    /\ SECSend(r)
    /\ uincoming' = [x \in Replica |->  \* broadcast uset[r]
              IF x = r THEN uincoming[x]
                       ELSE uincoming[x] \cup {[aid |-> [r |->r, seq |-> seq[r]], update |-> uset[r]]} ]  
                                          
StateSECDeliver(r, aid) ==  SECDeliver(r, aid)
=============================================================================
\* Modification History
\* Last modified Wed Jun 26 13:25:05 CST 2019 by xhdn
\* Created Tue Jun 11 17:33:04 CST 2019 by xhdn
