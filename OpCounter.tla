----------------------------- MODULE OpCounter -----------------------------
EXTENDS 
    Naturals, Sequences, SEC
-----------------------------------------------------------------------------
VARIABLES 
    counter,   \* counter[r]: current value of the counter at replica r \in Replica  
    buffer,    \* buffer[r]: number of increments performed since the last broadcast at replica r \in Replica
    seq,       \* seq[r]: local sequence number at replica r \in Replica
    incoming,  \* incoming[r]: incoming messages at replica r \in Replica
    msg,       \* incoming[r]: current message at replica r \in Replica
    messageSet \* network variable
    
vars == <<counter, buffer, seq, incoming, msg, messageSet, SECvars>>

Msg == [r : Replica, buf : Nat, seq : Nat, update : SUBSET Update]
-----------------------------------------------------------------------------
Network == INSTANCE ReliableNetwork
-----------------------------------------------------------------------------
TypeOK == 
    /\ counter \in [Replica -> Nat]
    /\ buffer \in [Replica -> Nat]
-----------------------------------------------------------------------------       
Init == 
    /\ counter = [r \in Replica |-> 0]
    /\ buffer = [r \in Replica |-> 0]
    /\ seq = [r \in Replica |-> 0]
    /\ Network!RInit
    /\ SECInit
     
Read(r) == counter[r]

Inc(r) == 
    /\ counter' = [counter EXCEPT ![r] = @ + 1]
    /\ buffer' = [buffer EXCEPT ![r] = @ + 1]
    /\ seq' = [seq EXCEPT ![r] = @ + 1]
    /\ SECUpdate(r, seq[r])
    /\ UNCHANGED <<incoming, msg, messageSet>>

Send(r) ==  
    /\ buffer[r] # 0
    /\ buffer' = [buffer EXCEPT ![r] = 0]
    /\ Network!RBroadcast(r, [r |-> r, buf |-> buffer[r], seq |-> seq[r], update|-> OpUpdate(r)])
    /\ SECSend(r)
    /\ UNCHANGED <<counter, seq>>

Receive(r) == 
    /\ counter' = [counter EXCEPT ![r] = @ + msg'[r].buf]
    /\ Network!RDeliver(r)
    /\ SECDeliver(r, msg'[r])
    /\ UNCHANGED <<buffer, seq>>
-----------------------------------------------------------------------------                
Next == \E r \in Replica: Inc(r) \/ Send(r)\/ Receive(r)
-----------------------------------------------------------------------------                   
Spec == Init /\ [][Next]_vars   
-----------------------------------------------------------------------------
EmptyBuffer == buffer = [r \in Replica |-> 0]
EC == Network!EmptyChannel /\ EmptyBuffer
            => \A r1, r2 \in Replica : counter[r1] = counter[r2]
            
SEC == \A r1, r2 \in Replica : SameUpdate(r1, r2) => counter[r1] = counter[r2]
=============================================================================
\* Modification History
\* Last modified Wed May 15 19:56:44 CST 2019 by zfwang
\* Last modified Tue May 07 00:57:30 CST 2019 by xhdn
\* Last modified Mon May 06 15:51:30 CST 2019 by jywellin
\* Created Fri Mar 22 20:43:27 CST 2019 by jywellin
