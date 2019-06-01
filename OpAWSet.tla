------------------------------ MODULE OpAWSet ------------------------------
EXTENDS Naturals, Sequences, Bags, TLC, SEC

CONSTANTS 
    Data      \* the set of data
    

  
VARIABLES 
    set,            \* set[r]: set of active Instance(s) maintained by r \in Replica
    seq,            \* seq[r]: local sequence number at replica r \in Replica
    abuf,           \* buffer of elements added
    rbuf,           \* buffer of elements removed
    
    (* Network variables *)    
    
    incoming,        \* incoming[r]: incoming messages at replica r \in Replica   
    msg,            
    messageset, 
    vc               \* vector clock

Instance == [d: Data, r: Replica, k: Nat] 
NETvars == <<incoming, msg, messageset, vc>>
vars == <<set, seq, abuf, rbuf, NETvars, SECvars>>
vector == [Replica -> Nat]
Msg == [r : Replica, update : SUBSET Update, seq : Nat, vc : vector, abuf : SUBSET Instance, rbuf: SUBSET Instance]
-----------------------------------------------------------------------------
(**********************************************************************)
(* Reliable Causal Network                                            *)
(**********************************************************************)
Network == INSTANCE ReliableCausalNetwork
-----------------------------------------------------------------------------
TypeOK == 
    /\ set \in [Replica -> SUBSET Instance]
    /\ abuf \in [Replica -> SUBSET Instance]
    /\ rbuf \in [Replica -> SUBSET Instance]
    /\ seq \in [Replica -> Nat]
-----------------------------------------------------------------------------
Init == 
    /\ seq = [r \in Replica |-> 0]  
    /\ set = [r \in Replica |-> {}] 
    /\ abuf = [r \in Replica |-> {}]
    /\ rbuf = [r \in Replica |-> {}]
    /\ Network!RCInit
    /\ SECInit
-----------------------------------------------------------------------------                                    
Send(r) == 
    /\ \/ abuf[r] # {}
       \/ rbuf[r] # {}
    /\ Network!RCBroadcast(r, [r |-> r, seq |-> seq[r], update|-> OpUpdate(r), 
                               vc |-> [vc EXCEPT ![r][r] = @ + 1][r], abuf|-> abuf[r], rbuf|-> rbuf[r] ])
    /\ abuf' = [abuf EXCEPT ![r] = {}]
    /\ rbuf' = [rbuf EXCEPT ![r] = {}]
    /\ SECSend(r)
    /\ UNCHANGED <<seq, set>>  
              
Receive(r) == 
    /\ Network!RCDeliver(r)
    /\ SECDeliver(r, msg'[r])
    /\ set' = [set EXCEPT ![r] = (@ \cup msg'.abuf) \ msg'.rbuf]
    /\ UNCHANGED <<seq, abuf, rbuf>>         
-----------------------------------------------------------------------------
Add(d, r) == 
    /\ seq' = [seq EXCEPT ![r] = @ + 1]
    /\ SECUpdate(r, seq[r])
    /\ set' = [set EXCEPT ![r] = @ \union {[d |-> d, r |-> r, k |-> seq[r]]}] 
    /\ abuf'= [abuf EXCEPT ![r] = @ \union {[d |-> d, r |-> r, k |-> seq[r]]}] 
    /\ UNCHANGED <<rbuf, NETvars>>     

Remove(d, r) ==
    /\ {ins \in set[r] : ins.d = d} # {}
    /\ seq' = [seq EXCEPT ![r] = @ + 1]
    /\ SECUpdate(r, seq[r])
    /\ LET D == {ins \in set[r] : ins.d = d}
       IN /\  set' = [set EXCEPT ![r] = @ \ D]  
          /\  rbuf' = [rbuf EXCEPT ![r] = @ \cup D]  
    /\ UNCHANGED <<abuf, NETvars>>          
-----------------------------------------------------------------------------
Next ==
    \/ \E r \in Replica: \E a \in Data: 
        Add(a, r) \/ Remove(a, r)
    \/ \E r \in Replica: 
        Receive(r) \/ Send(r)

Spec == Init /\ [][Next]_vars
-----------------------------------------------------------------------------
Read(r) == {ins.d: ins \in set[r]}
 
SEC == \A r1, r2 \in Replica : 
        Sameupdate(r1, r2) => Read(r1) = Read(r2)
=============================================================================
\* Modification History
\* Last modified Sat Jun 01 20:54:42 CST 2019 by xhdn
\* Created Fri May 24 14:12:26 CST 2019 by xhdn
