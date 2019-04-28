----------------------------- MODULE OpCounter -----------------------------
EXTENDS 
    Naturals, Sequences
-----------------------------------------------------------------------------
CONSTANTS 
    Replica 
-----------------------------------------------------------------------------
VARIABLE 
    counter,
    buffer,
    seq,
    incoming,  \* network variable
    msg,       \* network variable
    updateset  \* network variable
    
vars == <<counter, buffer, seq, incoming, msg, updateset>>

Msg == [r : Replica, seq : Nat, buf : Nat]
-----------------------------------------------------------------------------
(**********************************************************************)
(* Reliable network.                                                  *)
(**********************************************************************)
Network == INSTANCE ReliableNetwork
-----------------------------------------------------------------------------
TypeOK == 
    /\ counter \in [Replica -> Nat]
    /\ buffer \in [Replica -> Nat]
 
-----------------------------------------------------------------------------       
Init == 
    /\ Network!RInit
    /\ seq = [r \in Replica |-> 0]
    /\ counter = [r \in Replica |-> 0 ]
    /\ buffer = [r \in Replica |-> 0 ]
     
Read(r) == counter[r]

Inc(r) == 
    /\ counter' = [counter EXCEPT ![r] = @ + 1]
    /\ buffer' = [buffer EXCEPT ![r] = @ + 1]
    /\ seq' = [seq EXCEPT ![r] = @ + 1]
    /\ UNCHANGED <<incoming, msg, updateset>>

Send(r) ==  
    /\ buffer[r] # 0
    /\ buffer' = [buffer EXCEPT ![r] = 0]
    /\ Network!RBroadcast(r, [r |-> r, seq |-> seq[r], buf |-> buffer[r]])
    /\ UNCHANGED <<counter, seq>>

Receive(r) == 
    /\ Network!RDeliver(r)
    /\ counter' = [counter EXCEPT ![r] = @ + msg'[r].buf]
    /\ UNCHANGED <<buffer, seq>>
-----------------------------------------------------------------------------                
Next == 
   \E r \in Replica: Inc(r) \/ Send(r)\/ Receive(r)
-----------------------------------------------------------------------------                   
Spec == Init /\ [][Next]_vars   
-----------------------------------------------------------------------------
EmptyBuffer == buffer = [r \in Replica |-> 0 ]
EC == Network!EmptyChannel /\ EmptyBuffer
            => \A r1, r2 \in Replica : counter[r1] = counter[r2]
            
SEC == \E r1, r2 \in Replica : Network!Sameupdate(r1, r2)
            => counter[r1] = counter[r2]
=============================================================================
\* Modification History
\* Last modified Sun Apr 28 14:17:44 CST 2019 by jywellin
\* Last modified Sun Apr 21 18:49:22 CST 2019 by xhdn
\* Created Fri Mar 22 20:43:27 CST 2019 by jywellin
