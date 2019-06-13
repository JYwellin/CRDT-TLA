----------------------------- MODULE Interface -----------------------------
EXTENDS Naturals
CONSTANTS Replica
----------------------------------------------------------------------------- 
Vector == [Replica -> Nat]  
InitVector == [Replica -> 0]
----------------------------------------------------------------------------- 
VARIABLES  seq              \* seq[r]: local action sequence number at replica r \in Replica
----------------------------------------------------------------------------- 
IntTypeOK == seq \in [Replica ->  Nat]   \*check types

IntInit == seq = [r \in Replica |-> 0]   \*initial state
        
IntSend(r) ==  seq' = [seq EXCEPT ![r] = @ + 1]  \*IntSend(r) : r \in Replica sends a message
    
IntDeliver(r) == seq' = [seq EXCEPT ![r] = @ + 1]  \*r \in Replica receives a message
 
IntDo(r) == seq' = [seq EXCEPT ![r] = @ + 1]       \*r \in Replica  
=============================================================================
\* Modification History
\* Last modified Thu Jun 13 15:02:52 CST 2019 by xhdn
\* Created Fri Jun 07 21:46:19 CST 2019 by xhdn
