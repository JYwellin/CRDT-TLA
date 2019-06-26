-------------------------------- MODULE SEC --------------------------------
EXTENDS Naturals, CRDTInterface
-----------------------------------------------------------------------------
CONSTANTS Read(_)  \* Read(r \in Replica): the read operation at r 
    
UMsg == [aid : Aid, update: SUBSET Aid]  \* SEC message type   
-----------------------------------------------------------------------------
VARIABLES 
    uset,       \* uset[r]: the set of updates seen by replica r \in Replica
    uincoming   \* uincoming[r]: incoming channel for broadcasting/delivering updates at r \in Replica
    
SECTypeOK ==
    /\ uset \in [Replica -> SUBSET Aid]
    /\ uincoming \in [Replica -> SUBSET UMsg]
-----------------------------------------------------------------------------   
SECInit == 
    /\ uset = [r \in Replica |-> {}]
    /\ uincoming = [r \in Replica |-> {}]
    
SECDo(r) == 
    /\ uset' = [uset EXCEPT ![r] = @ \cup {[r |-> r, seq |-> seq[r]]}]
    /\ UNCHANGED <<uincoming>>

SECSend(r) ==  UNCHANGED <<uset>>  \* implemented by OpSEC and StateSEC
           
SECDeliver(r, aid) ==  \* choose the SEC message um according to aid
    /\ LET um == CHOOSE m \in uincoming[r] : m.aid = aid \* um is unique
       IN  uset' = [uset EXCEPT ![r] = @ \cup um.update] 
    /\ UNCHANGED <<uincoming>>
-----------------------------------------------------------------------------   
SEC == \A r1, r2 \in Replica : uset[r1] = uset[r2] => Read(r1) = Read(r2)
=============================================================================
\* Modification History
\* Last modified Wed Jun 26 13:23:02 CST 2019 by xhdn
\* Last modified Mon May 06 16:50:42 CST 2019 by jywellin
\* Created Sun May 05 15:42:13 CST 2019 by jywellin
