---------------------------- MODULE FIFONetwork ----------------------------
EXTENDS Network
-----------------------------------------------------------------------------
VARIABLES 
    seqrecord
-----------------------------------------------------------------------------
FInit == /\ NInit
         /\ seqrecord = [r \in Replica |-> [s \in Replica |-> 0]]

FBroadcast(r, m) == /\ NBroadcast(r, m)
                    /\ UNCHANGED <<seqrecord>> 

FDeliver(r) == 
    /\ incoming[r] # EmptyBag
    /\ \E m \in BagToSet(incoming[r]):
        /\ m.seq >= seqrecord[r][m.r]
        /\ msg' = m
        /\ MDeliver(r, m)
        /\ seqrecord' = [seqrecord EXCEPT ![r][m.r] = m.seq]
    /\ UNCHANGED <<incoming>>      
=============================================================================
\* Modification History
\* Last modified Sat Jun 01 20:26:15 CST 2019 by xhdn
\* Created Thu May 30 17:19:42 CST 2019 by xhdn
