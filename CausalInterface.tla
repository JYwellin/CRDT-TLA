-------------------------- MODULE CausalInterface --------------------------
EXTENDS SEC
-----------------------------------------------------------------------------    
Vector == [Replica -> Nat]      
-----------------------------------------------------------------------------  
(* Op-based AWSet definition *)

-----------------------------------------------------------------------------    
VARIABLES 
    (* Network variables *)    
    incoming,        \* incoming[r]: incoming messages at replica r \in Replica   
    msg,            
    messageset, 
    vc,              \* vector clock
    seq              \* seq[r]: local sequence number at replica r \in Replica
    
NETvars == <<incoming, msg, messageset, vc, seq>>
----------------------------------------------------------------------------- 
IntTypeOK ==
     seq \in [Replica ->  Nat]

IntInit ==   
    /\ seq = [r \in Replica |-> 0]   
    /\ SECInit 
        
IntSend(r, m) ==
    /\ SECSend(r)
    /\ UNCHANGED <<seq>>
    
IntReceive(r) ==
    /\ SECDeliver(r, msg')
    /\ UNCHANGED <<seq>>
 
IntDo(r) ==
    /\ seq' = [seq EXCEPT ![r] = @ + 1]
    /\ SECUpdate(r, seq[r])
    /\ UNCHANGED <<incoming, msg, messageset, vc>>

=============================================================================
\* Modification History
\* Last modified Fri Jun 07 21:50:51 CST 2019 by xhdn
\* Created Mon Jun 03 21:20:23 CST 2019 by xhdn
