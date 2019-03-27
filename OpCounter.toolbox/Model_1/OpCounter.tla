----------------------------- MODULE OpCounter -----------------------------
(**********************************************************************)
(* Reliable network.                                                  *)
(* Casual is unnecessary.                                             *)
(**********************************************************************)
EXTENDS Naturals,Sequences,Bags
-----------------------------------------------------------------------------
CONSTANTS Replica 
-----------------------------------------------------------------------------
VARIABLE counter,buffer,incoming,msg
vars == <<counter,buffer,incoming,msg>>
netvars == <<incoming,msg>>
statevars == <<counter,buffer>>
-----------------------------------------------------------------------------
Network == INSTANCE ReliableNetwork WITH  incoming <- incoming,msg <- msg
-----------------------------------------------------------------------------
TypeOK == /\ counter \in [Replica -> Nat]
          /\ buffer \in [Replica -> Nat]

-----------------------------------------------------------------------------
          
Init == /\ Network!Init
        /\ counter = [r \in Replica |-> 0 ]
        /\ buffer = [r \in Replica |-> 0 ]

        
Read(r) == counter[r]

Inc(r) == /\ counter' = [counter EXCEPT ![r] = @ + 1]
          /\ buffer' = [buffer EXCEPT ![r] = @ + 1]
          /\ UNCHANGED netvars

Send(r) ==  /\ buffer[r] # 0
            /\ buffer' = [buffer EXCEPT ![r] = 0]
            /\ Network!Broadcast(r, SetToBag({buffer[r]}))
            /\ UNCHANGED <<counter>>

Receive(r) == /\ Network!Deliver(r)
              /\ counter' = [counter EXCEPT ![r] = @ + msg'[r]]
              /\ UNCHANGED <<buffer>>
              
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
\* Last modified Wed Mar 27 17:01:06 CST 2019 by jywellin
\* Created Fri Mar 22 20:43:27 CST 2019 by jywellin
