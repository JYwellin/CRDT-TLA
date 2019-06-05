----------------------------- MODULE OpCounter -----------------------------
EXTENDS 
    Naturals, Sequences, SEC
-----------------------------------------------------------------------------
VARIABLE 
    counter,      \* current value
    buffer,       \* buffer of increments
    seq,          \* update sequence for each replica   
    incoming,     \* network variable
    msg,          \* network variable
    messageset    \* network variable
    
NETvars == <<incoming, msg, messageset>>    
vars == <<counter, buffer, seq, NETvars, SECvars>>

Msg == [r : Replica, seq : Nat, update : SUBSET Uid, buf : Nat]
-----------------------------------------------------------------------------
(**********************************************************************)
(* Reliable Network                                                   *)
(**********************************************************************)
Network == INSTANCE ReliableNetwork
-----------------------------------------------------------------------------
TypeOK == 
    /\ counter \in [Replica -> Nat]
    /\ buffer \in [Replica -> Nat]
-----------------------------------------------------------------------------       
Init == 
    /\ seq = [r \in Replica |-> 0]
    /\ counter = [r \in Replica |-> 0]
    /\ buffer = [r \in Replica |-> 0]
    /\ Network!RInit
    /\ SECInit
     
Read(r) == counter[r]

Inc(r) == 
    /\ counter' = [counter EXCEPT ![r] = @ + 1]
    /\ buffer' = [buffer EXCEPT ![r] = @ + 1]
    /\ seq' = [seq EXCEPT ![r] = @ + 1]
    /\ SECUpdate(r, seq[r])
    /\ UNCHANGED <<NETvars>>

Send(r) ==  
    /\ buffer[r] # 0
    /\ buffer' = [buffer EXCEPT ![r] = 0]
    /\ Network!RBroadcast(r, [r |-> r, seq |-> seq[r], update|-> OpUpdate(r), buf |-> buffer[r]])
    /\ SECSend(r)
    /\ UNCHANGED <<counter, seq>>

Receive(r) == 
    /\ Network!RDeliver(r)
    /\ SECDeliver(r, msg')
    /\ counter' = [counter EXCEPT ![r] = @ + msg'.buf]
    /\ UNCHANGED <<buffer, seq>>
-----------------------------------------------------------------------------                
Next == 
   \E r \in Replica: Inc(r) \/ Send(r)\/ Receive(r)
-----------------------------------------------------------------------------                   
Spec == Init /\ [][Next]_vars   
-----------------------------------------------------------------------------       
SEC == \A r1, r2 \in Replica : Sameupdate(r1, r2)
                                => counter[r1] = counter[r2]
=============================================================================
\* Modification History
\* Last modified Tue Jun 04 15:20:19 CST 2019 by xhdn
\* Last modified Mon May 06 15:51:30 CST 2019 by jywellin
\* Created Fri Mar 22 20:43:27 CST 2019 by jywellin
