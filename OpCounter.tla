----------------------------- MODULE OpCounter -----------------------------
EXTENDS 
    Naturals, Sequences, SEC
-----------------------------------------------------------------------------
VARIABLES 
    counter,   \* counter[r]: current value of the counter at replica r \in Replica  
    incVal,     \* delta[r]: number of increments performed since the last broadcast at replica r \in Replica
    seq,       \* seq[r]: local sequence number at replica r \in Replica
    incoming,  \* incoming[r]: incoming messages at replica r \in Replica
    msg,       \* incoming[r]: current message at replica r \in Replica
    messageSet \* network variable
    
vars == <<counter, incVal, seq, incoming, msg, messageSet, SECvars>>

Msg == [r : Replica, buf : Nat, seq : Nat, update : SUBSET Update]
-----------------------------------------------------------------------------
Network == INSTANCE ReliableNetwork
-----------------------------------------------------------------------------
TypeOK == 
    /\ counter \in [Replica -> Nat]
    /\ incVal \in [Replica -> Nat]
    /\ seq \in [Replica -> Nat]
-----------------------------------------------------------------------------       
Init == 
    /\ counter = [r \in Replica |-> 0]
    /\ incVal = [r \in Replica |-> 0]
    /\ seq = [r \in Replica |-> 0]
    /\ Network!RInit
    /\ SECInit
     
Read(r) == counter[r]

Inc(r) == 
    /\ counter' = [counter EXCEPT ![r] = @ + 1]
    /\ incVal' = [incVal EXCEPT ![r] = @ + 1]
    /\ seq' = [seq EXCEPT ![r] = @ + 1]
    /\ SECUpdate(r, seq[r])
    /\ UNCHANGED <<incoming, msg, messageSet>>

Send(r) ==  
    /\ incVal[r] # 0
    /\ incVal' = [incVal EXCEPT ![r] = 0]
    /\ Network!RBroadcast(r, [r |-> r, buf |-> incVal[r], seq |-> seq[r], update|-> OpUpdate(r)])
    /\ SECSend(r)
    /\ UNCHANGED <<counter, seq>>

Receive(r) == 
    /\ Network!RDeliver(r)
    /\ SECDeliver(r, msg'[r])
    /\ counter' = [counter EXCEPT ![r] = @ + msg'[r].buf]
    /\ UNCHANGED <<incVal, seq>>
-----------------------------------------------------------------------------                
Next == \E r \in Replica: Inc(r) \/ Send(r)\/ Receive(r)
-----------------------------------------------------------------------------                   
Spec == Init /\ [][Next]_vars   
-----------------------------------------------------------------------------
EmptyBuffer == incVal = [r \in Replica |-> 0]
EC == Network!EmptyChannel /\ EmptyBuffer
            => \A r1, r2 \in Replica : Read(r1) = Read(r2)
            
SEC == \A r1, r2 \in Replica : SameUpdate(r1, r2) => Read(r1) = Read(r2)
=============================================================================
\* Modification History
\* Last modified Fri May 31 08:19:43 CST 2019 by zfwang
\* Last modified Tue May 07 00:57:30 CST 2019 by xhdn
\* Last modified Mon May 06 15:51:30 CST 2019 by jywellin
\* Created Fri Mar 22 20:43:27 CST 2019 by jywellin
