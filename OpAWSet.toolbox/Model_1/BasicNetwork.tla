---------------------------- MODULE BasicNetwork ----------------------------
EXTENDS SystemModel
-----------------------------------------------------------------------------
VARIABLES lmsg  \* lmsg[r]: the last message delivered at r \in Replica to the upper-layer protocol 

nVars == <<incoming, lmsg>>
-----------------------------------------------------------------------------
BNInit == 
    /\ incoming = [r \in Replica |-> {}]
    /\ lmsg = [r \in Replica |-> NotMsg]

BNBroadcast(r, m) == 
    /\ incoming' = [x \in Replica |-> IF x = r THEN incoming[x]
                                               ELSE incoming[x] \cup {m} ]                    
    /\ UNCHANGED <<lmsg>> 

BNDeliver(r) == 
    /\ incoming[r] # {}               \* choose m from incoming[r] non-deterministically 
    /\ \E m \in incoming[r]: lmsg' = [lmsg EXCEPT ![r] = m]  
    /\ UNCHANGED <<incoming>>  
=============================================================================
\* Modification History
\* Last modified Mon Jun 17 17:11:51 CST 2019 by xhdn
\* Created Sun Jun 09 20:27:37 CST 2019 by xhdn
