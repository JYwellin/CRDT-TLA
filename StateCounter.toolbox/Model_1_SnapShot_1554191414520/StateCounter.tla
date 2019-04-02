---------------------------- MODULE StateCounter ----------------------------
EXTENDS Naturals, Sequences, Bags, TLC
-----------------------------------------------------------------------------
CONSTANTS 
    Replica
    
-----------------------------------------------------------------------------    
VARIABLES 
    state, incoming, update, msg
    vars == <<state, incoming, update, msg>>
    netvars == <<incoming, msg>>
    statevars == <<state, update>> 
    
vector == [Replica -> Nat]
initvector == [r \in Replica |-> 0]
-----------------------------------------------------------------------------  
(**********************************************************************)
(* Any network.                                                       *)
(**********************************************************************)
Network == INSTANCE ReliableNetwork WITH  incoming <- incoming,msg <- msg
-----------------------------------------------------------------------------
TypeOK == /\ state \in [Replica -> vector]
          /\ update \in [Replica -> {0,1}]
          /\ Network!TypeOK
          
-----------------------------------------------------------------------------
Init == /\ Network!Init
        /\ state = [r \in Replica |-> initvector]
        /\ update = [r \in Replica |-> 0]
        
 -----------------------------------------------------------------------------       
\*count(x,sum) == count(sum) + 
\*read(r) == count(state[r],0)

Inc(r) == /\ state' = [state EXCEPT ![r][r] = @ + 1]
          /\ update' = [update EXCEPT![r] = 1]
          /\ UNCHANGED netvars


Send(r) == /\ Network!Broadcast(r, SetToBag({state[r]}))
           /\ update' = [update EXCEPT![r] = 0]
           /\ UNCHANGED <<state>>
   

SetMax(r, s) == IF r > s THEN r ELSE s
    
Receive(r) == /\ Network!Deliver(r)
              /\ \A s \in Replica: state' = [state EXCEPT ![r][s] = SetMax(@, msg'[s])]                 
              /\ UNCHANGED <<update>>
-----------------------------------------------------------------------------
Next == /\ \E r \in Replica: Inc(r) \/ Send(r) \/ Receive(r)
-----------------------------------------------------------------------------
Spec == Init /\ [][Next]_vars
-----------------------------------------------------------------------------
EmptyUpdate == update = [r \in Replica |-> 0 ]
EC == Network!EmptyChannel /\ EmptyUpdate
            => \A r,s \in Replica : state[r] = state[s]

=============================================================================
\* Modification History
\* Last modified Tue Apr 02 15:48:59 CST 2019 by jywellin
\* Created Mon Mar 25 14:25:48 CST 2019 by jywellin
