------------------------------ MODULE StateSEC ------------------------------
EXTENDS SEC
-----------------------------------------------------------------------------
StateSECInit ==  SECInit
    
StateSECUpdate(r, seq) == SECUpdate(r, seq) 
    
StateSECSend(r, seq) == 
    /\ SECSend(r)
    /\ uincoming' = [x \in Replica |->
                        IF x = r
                        THEN uincoming[x]
                        ELSE uincoming[x] \cup {[r |-> r, seq |->seq, update |-> updateset[r]]} ]  
                    
StateSECDeliver(r, aid) ==  SECDeliver(r, SearchMsg(uincoming[r], aid).update)
=============================================================================
\* Modification History
\* Last modified Thu Jun 13 19:00:28 CST 2019 by xhdn
\* Created Tue Jun 11 17:33:04 CST 2019 by xhdn
