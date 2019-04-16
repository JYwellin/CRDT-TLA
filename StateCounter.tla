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
    incoming, \* network variable
    msg,      \* network variable
    updateset, \* network variable
    vc

vars == <<state, update, seq, incoming, msg, updateset>>

vector == [Replica -> Nat]
initvector == [r \in Replica |-> 0]
Msg == [r : Replica, seq : Nat, vc : vector]
-----------------------------------------------------------------------------  
(**********************************************************************)
(* Any network.                                                       *)
(**********************************************************************)
Network == INSTANCE Network
-----------------------------------------------------------------------------
TypeOK == 
    /\ state \in [Replica -> vector]
    /\ update \in [Replica -> {0,1}]
-----------------------------------------------------------------------------
Init == 
    /\ Network!NInit
    /\ state = [r \in Replica |-> initvector]
    /\ update = [r \in Replica |-> 0]
    /\ seq = [r \in Replica |-> 0]       
 -----------------------------------------------------------------------------       
Inc(r) == 
    /\ state' = [state EXCEPT ![r][r] = @ + 1]
    /\ update' = [update EXCEPT![r] = 1]
    /\ seq' = [seq EXCEPT ![r] = @ + 1]
    /\ UNCHANGED <<incoming, msg, updateset>>


Send(r) == 
    /\ Network!NBroadcast(r, [r |-> r, seq |-> seq[r], vc |-> state[r]])
    /\ update' = [update EXCEPT![r] = 0]
    /\ UNCHANGED <<state, seq>>
   

SetMax(r, s) == IF r > s THEN r ELSE s
    
Receive(r) == 
    /\ Network!NDeliver(r)
    /\ \A s \in Replica : state' = [state EXCEPT ![r][s] = SetMax(@, msg'[r].vc[s])]                 
    /\ UNCHANGED <<update, seq>>
-----------------------------------------------------------------------------
Next == /\ \E r \in Replica: Inc(r) \/ Send(r) \/ Receive(r)
-----------------------------------------------------------------------------
Spec == Init /\ [][Next]_vars
-----------------------------------------------------------------------------
EmptyUpdate == update = [r \in Replica |-> 0 ]
            
SEC == \E r1, r2 \in Replica : Network!Sameupdate(r1, r2)
            => state[r1] = state[r2]

=============================================================================
\* Modification History
\* Last modified Tue Apr 16 19:46:10 CST 2019 by jywellin
\* Created Mon Mar 25 14:25:48 CST 2019 by jywellin
