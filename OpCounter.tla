----------------------------- MODULE OpCounter -----------------------------
EXTENDS Counter
CONSTANTS Read(_), InitMsg
-----------------------------------------------------------------------------
VARIABLES 
    counter,    \* counter[r]: current value at r \in Replica
    buf,        \* buf[r]: buffer of increments at r \in Replica
(* variables for network: *)    
    incoming,   \* incoming[r]: incoming channel at replica r \in Replica
    lmsg,       \* lmsg[r]: the last message delivered at r \in Replica to the upper-layer protocol 
(* variables for SEC: *)
    uset,       \* uset[r]: the set of updates seen by replica r \in Replica
    uincoming,  \* uincoming[r]: incoming channel for broadcasting/delivering updates at r \in Replica
    buset       \* buset[r]: the buffer of local updates made by r \in Replica since the last broadcast 

nVars == <<incoming, lmsg>>
secVars == <<uset, uincoming, buset>> 
vars == <<counter, buf, seq, nVars, secVars>>   
-----------------------------------------------------------------------------
Msg == [aid : Aid, buf : Nat]
Network == INSTANCE ReliableNetwork \* WITH incoming <- incoming, lmsg <- lmsg                                               

ReadOpCounter(r) == counter[r]   \* read the state of r\in Replica                                                     
SEC == INSTANCE OpSEC \* WITH uset <- uset, uincoming <- uincoming, buset <- buset                                        
-----------------------------------------------------------------------------
TypeOK == 
    /\ counter \in [Replica -> Nat]
    /\ buf \in [Replica -> Nat]
    /\ IntTypeOK
    /\ SEC!SECTypeOK
-----------------------------------------------------------------------------
Init ==   
    /\ counter = [r \in Replica |-> 0] 
    /\ buf = [r \in Replica |-> 0] 
    /\ IntInit
    /\ Network!RNInit
    /\ SEC!OpSECInit    
-----------------------------------------------------------------------------
Inc(r) ==  \* r\in Replica adds d \in Data
    /\ counter' = [counter EXCEPT ![r] = @ + 1]
    /\ buf' = [buf EXCEPT ![r] = @ + 1]
    /\ IntDo(r)
    /\ SEC!OpSECDo(r)
    /\ UNCHANGED <<nVars>>     
    
Do(r) == Inc(r)\* We ignore ReadOpCounter(r) since it does not modify states.     
-----------------------------------------------------------------------------                                    
Send(r) ==  \* r\in Replica sends a message 
    /\ buf[r] # 0
    /\ buf' = [buf EXCEPT ![r] = 0]
    /\ Network!RNBroadcast(r, [aid |-> [r |-> r, seq |-> seq[r]], buf |-> buf[r]])
    /\ IntSend(r)
    /\ SEC!OpSECSend(r)
    /\ UNCHANGED <<counter>>  
              
Deliver(r) ==  \* r\in Replica delivers a message (lmsg'[r]) 
    /\IntDeliver(r)
    /\Network!RNDeliver(r)
    /\SEC!OpSECDeliver(r, lmsg'[r].aid)
    /\counter' = [counter EXCEPT ![r] = @ + lmsg'[r].buf]
    /\UNCHANGED <<buf>>    
-----------------------------------------------------------------------------
Next == \E r \in Replica: Do(r) \/ Send(r) \/ Deliver(r) 

Spec == Init /\ [][Next]_vars  
=============================================================================
\* Modification History
\* Last modified Wed Jul 31 23:21:13 CST 2019 by xhdn
\* Last modified Sat Jul 27 16:05:16 CST 2019 by jywellin
\* Created Thu Jul 25 16:38:30 CST 2019 by jywellin
