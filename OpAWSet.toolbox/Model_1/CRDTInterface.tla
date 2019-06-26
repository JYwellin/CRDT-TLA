--------------------------- MODULE CRDTInterface ---------------------------
EXTENDS Naturals
CONSTANTS Replica

Aid == [r : Replica, seq : Nat]  \* action id
----------------------------------------------------------------------------- 
VARIABLES  seq  \* seq[r]: local sequence number for actions at replica r \in Replica
  \* incremented upon each action (IntDo, IntSend, and IntDeliver)
 
IntTypeOK == seq \in [Replica -> Nat]   
-----------------------------------------------------------------------------
IntInit == seq = [r \in Replica |-> 0]   

IntDo(r) == seq' = [seq EXCEPT ![r] = @ + 1]   
        
IntSend(r) == seq' = [seq EXCEPT ![r] = @ + 1]  
    
IntDeliver(r) == UNCHANGED <<seq>>  
=============================================================================
\* Modification History
\* Last modified Mon Jun 17 15:02:27 CST 2019 by xhdn
\* Created Mon Jun 17 14:58:23 CST 2019 by xhdn
