---------------------------- MODULE StateCounter ----------------------------
EXTENDS Naturals, Sequences, Bags, TLC, SEC
-----------------------------------------------------------------------------    
VARIABLES 
    state,
    seq,
    incoming,     \* network variable
    msg,          \* network variable
    messageset    \* network variable
    
NETvars == <<incoming, msg, messageset>>
vars == <<state, seq, NETvars, SECvars>>

Vector == [Replica -> Nat]
InitVector == [r \in Replica |-> 0]
Msg == [r : Replica, seq : Nat, update : SUBSET Update, vc : Vector]
-----------------------------------------------------------------------------  
(**********************************************************************)
(* Any network                                                        *)
(**********************************************************************)
Network == INSTANCE Network
-----------------------------------------------------------------------------
TypeOK == 
    /\ state \in [Replica -> Vector]
-----------------------------------------------------------------------------
Init == 
    /\ Network!NInit
    /\ SECInit
    /\ state = [r \in Replica |-> InitVector]
    /\ seq = [r \in Replica |-> 0]       
-----------------------------------------------------------------------------       
Inc(r) == 
    /\ state' = [state EXCEPT ![r][r] = @ + 1]
    /\ seq' = [seq EXCEPT ![r] = @ + 1]
    /\ SECUpdate(r, seq[r])
    /\ UNCHANGED NETvars
-----------------------------------------------------------------------------  
Send(r) == 
    /\ Network!NBroadcast(r, [r |-> r, seq |-> seq[r], update|-> StateUpdate(r), vc |-> state[r]])
    /\ SECSend(r)
    /\ UNCHANGED <<state, seq>>
   
SetMax(r, s) == IF r > s THEN r ELSE s
    
Receive(r) == 
    /\ Network!NDeliver(r)
    /\ SECDeliver(r, msg')
    /\ \A s \in Replica : state' = [state EXCEPT ![r][s] = SetMax(@, msg'.vc[s])]                 
    /\ UNCHANGED <<seq>>
-----------------------------------------------------------------------------
Next == /\ \E r \in Replica: Inc(r) \/ Send(r) \/ Receive(r)
-----------------------------------------------------------------------------
Spec == Init /\ [][Next]_vars
-----------------------------------------------------------------------------           
SEC == \E r1, r2 \in Replica : Sameupdate(r1, r2)
                                => state[r1] = state[r2]
=============================================================================
\* Modification History
\* Last modified Sat Jun 01 21:05:18 CST 2019 by xhdn
\* Last modified Mon May 06 15:54:02 CST 2019 by jywellin
\* Created Mon Mar 25 14:25:48 CST 2019 by jywellin
