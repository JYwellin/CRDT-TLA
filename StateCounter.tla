---------------------------- MODULE StateCounter ----------------------------
EXTENDS Naturals, Sequences, Bags, TLC, SEC
-----------------------------------------------------------------------------    
VARIABLES 
    counter,      \* counter[r][s]: current value of the Replica[s] at replica[r]
    sendAllowed,  \* sendAllowed[r]: is the replica r \in Replica allowed to send a message
    seq,          \* seq[r]: local sequence number at replica r \in Replica
    incoming,     \* network variable
    msg,          \* network variable
    messageSet    \* network variable
    
vars == <<counter, sendAllowed, seq, incoming, msg, messageSet, SECvars>>

Vector == [Replica -> Nat]
InitVector == [r \in Replica |-> 0]
InitCounter == counter = [r \in Replica |-> InitVector]
Msg == [r : Replica, buf : Vector, seq : Nat, update : SUBSET Update]
-----------------------------------------------------------------------------  
Network == INSTANCE Network
-----------------------------------------------------------------------------
TypeOK == 
    /\ counter \in [Replica -> Vector]
    /\ sendAllowed \in [Replica -> {0,1}]
-----------------------------------------------------------------------------
Init == 
    /\ InitCounter
    /\ sendAllowed = [r \in Replica |-> 0]
    /\ seq = [r \in Replica |-> 0]       
    /\ Network!NInit
    /\ SECInit
-----------------------------------------------------------------------------       
Inc(r) == 
    /\ counter' = [counter EXCEPT ![r][r] = @ + 1]
    /\ sendAllowed' = [sendAllowed EXCEPT![r] = 1]
    /\ seq' = [seq EXCEPT ![r] = @ + 1]
    /\ SECUpdate(r, seq[r])
    /\ UNCHANGED <<incoming, msg, messageSet>>

Send(r) == 
    /\ sendAllowed' = [sendAllowed EXCEPT![r] = 0]
    /\ Network!NBroadcast(r, [r |-> r, buf |-> counter[r], seq |-> seq[r], 
       update |-> StateUpdate(r)])
    /\ SECSend(r)
    /\ UNCHANGED <<counter, seq>>
    
SetMax(r, s) == IF r > s THEN r ELSE s
    
Receive(r) == 
    /\ Network!NDeliver(r)
    /\ SECDeliver(r, msg'[r])
    /\ \A s \in Replica : 
            counter' = [counter EXCEPT ![r][s] = SetMax(@, msg'[r].buf[s])]                 
    /\ UNCHANGED <<sendAllowed, seq>>
-----------------------------------------------------------------------------
Next == /\ \E r \in Replica: Inc(r) \/ Send(r) \/ Receive(r)
-----------------------------------------------------------------------------
Spec == Init /\ [][Next]_vars
-----------------------------------------------------------------------------
Read(r) == counter[r]
SEC == \E r1, r2 \in Replica : SameUpdate(r1, r2) => Read(r1) = Read(r2)
=============================================================================
\* Modification History
\* Last modified Fri May 31 08:19:53 CST 2019 by zfwang
\* Last modified Mon May 06 15:54:02 CST 2019 by jywellin
\* Created Mon Mar 25 14:25:48 CST 2019 by jywellin
