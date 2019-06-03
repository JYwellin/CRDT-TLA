-------------------------- MODULE CausalInterface --------------------------
EXTENDS SEC
-----------------------------------------------------------------------------
CONSTANTS
    Data    \* the set of data
    
Vector == [Replica -> Nat]      
-----------------------------------------------------------------------------  
(* Op-based AWSet definition *)
Instance == [d: Data, r: Replica, k: Nat] 
Msg == [r : Replica, update : SUBSET Uid, seq : Nat, vc : Vector, abuf : SUBSET Instance, rbuf: SUBSET Instance]
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
(**********************************************************************)
(* Reliable Causal Network                                            *)
(**********************************************************************)
RNetwork == INSTANCE ReliableCausalNetwork
----------------------------------------------------------------------------- 
IntTypeOK ==
     seq \in [Replica ->  Nat]

IntInit ==   
    /\ seq = [r \in Replica |-> 0]   
    /\ RNetwork!RCInit 
    /\ SECInit 
        
IntSend(r, m) ==
    /\ RNetwork!RCBroadcast(r, m)
    /\ SECSend(r)
    /\ UNCHANGED <<seq>>
    
IntReceive(r) ==
    /\ RNetwork!RCDeliver(r)
    /\ SECDeliver(r, msg')
    /\ UNCHANGED <<seq>>
 
IntDo(r) ==
    /\ seq' = [seq EXCEPT ![r] = @ + 1]
    /\ SECUpdate(r, seq[r])
    /\ UNCHANGED <<incoming, msg, messageset, vc>>

=============================================================================
\* Modification History
\* Last modified Tue Jun 04 01:12:22 CST 2019 by xhdn
\* Created Mon Jun 03 21:20:23 CST 2019 by xhdn
