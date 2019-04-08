----------------------------- MODULE OpCounter -----------------------------
EXTENDS Naturals,Sequences,Bags
-----------------------------------------------------------------------------
CONSTANTS 
    Replica 
-----------------------------------------------------------------------------
VARIABLE 
    counter,
    buffer,
    seq,
    incoming,
    msg
    
vars == <<counter, buffer, seq, incoming, msg>>

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
    /\ Network!Init
    /\ seq = [r \in Replica |-> 0]
    /\ counter = [r \in Replica |-> 0 ]
    /\ buffer = [r \in Replica |-> 0 ]
     
Read(r) == counter[r]

Inc(r) == /\ counter' = [counter EXCEPT ![r] = @ + 1]
          /\ buffer' = [buffer EXCEPT ![r] = @ + 1]
          /\ seq' = [seq EXCEPT ![r] = @ + 1]
          /\ UNCHANGED <<incoming, msg>>

Send(r) ==  /\ buffer[r] # 0
            /\ buffer' = [buffer EXCEPT ![r] = 0]
            /\ Network!Broadcast(r, [r |-> r, seq |-> seq[r], buf |-> buffer[r]])
            /\ UNCHANGED <<counter, seq, msg>>

Receive(r) == /\ Network!Deliver(r)
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
            => \A r,s \in Replica : counter[r] = counter[s]

=============================================================================
\* Modification History
\* Last modified Tue Apr 02 21:17:42 CST 2019 by xhdn
\* Last modified Tue Apr 02 17:06:31 CST 2019 by jywellin
\* Created Fri Mar 22 20:43:27 CST 2019 by jywellin
