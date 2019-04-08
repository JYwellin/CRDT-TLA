---------------------------- MODULE StateCounter ----------------------------
EXTENDS Naturals, Sequences, Bags, TLC
-----------------------------------------------------------------------------
CONSTANTS 
    Replica
-----------------------------------------------------------------------------    
VARIABLES 
    state,
    update,
    seq,
    incoming,
    msg

vars == <<state, update, seq, incoming, msg>>

vector == [Replica -> Nat]
initvector == [r \in Replica |-> 0]
Msg == [r : Replica, seq : Nat, vc : vector]
-----------------------------------------------------------------------------  
(**********************************************************************)
(* Any network.                                                       *)
(**********************************************************************)
Network == INSTANCE ReliableNetwork
-----------------------------------------------------------------------------
TypeOK == 
    /\ state \in [Replica -> vector]
    /\ update \in [Replica -> {0,1}]
-----------------------------------------------------------------------------
Init == 
    /\ state = [r \in Replica |-> initvector]
    /\ update = [r \in Replica |-> 0]
    /\ seq = [r \in Replica |-> 0]       
 -----------------------------------------------------------------------------       
\*count(x,sum) == count(sum) + 
\*read(r) == count(state[r],0)

Inc(r) == 
    /\ state' = [state EXCEPT ![r][r] = @ + 1]
    /\ update' = [update EXCEPT![r] = 1]
    /\ seq' = [seq EXCEPT ![r] = @ + 1]
    /\ UNCHANGED <<incoming, msg>>


Send(r) == 
    /\ Network!Broadcast(r, [r |-> r, seq |-> seq[r], vc |-> state[r]])
    /\ update' = [update EXCEPT![r] = 0]
    /\ UNCHANGED <<state, seq>>
   

SetMax(r, s) == IF r > s THEN r ELSE s
    
Receive(r) == 
    /\ Network!Deliver(r)
    /\ \A s \in Replica : state' = [state EXCEPT ![r][s] = msg'[r].vc]                 
    /\ UNCHANGED <<update, seq>>
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
\* Last modified Mon Apr 08 19:30:41 CST 2019 by jywellin
\* Created Mon Mar 25 14:25:48 CST 2019 by jywellin
