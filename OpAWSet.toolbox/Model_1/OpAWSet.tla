------------------------------ MODULE OpAWSet ------------------------------
EXTENDS AWSet
CONSTANTS Read(_)
-----------------------------------------------------------------------------
VARIABLES 
    aset,       \* aset[r]: the set of active elements maintained by r \in Replica
    abuf,       \* abuf[r]: the buffer for elements added by r \in Replica since the last broadcast 
    rbuf,       \* rbuf[r]: the buffer for elements removed by r \in Replica since the last broadcast
(* variables for network: *)    
    incoming,   \* incoming[r]: incoming channel at replica r \in Replica
    lmsg,       \* lmsg[r]: the last message delivered at r \in Replica to the upper-layer protocol 
    vc,         \* vc[r][s] denotes the latest message from s \in Replica observed by r \in Replica
(* variables for SEC: *)
    uset,       \* uset[r]: the set of updates seen by replica r \in Replica
    uincoming,  \* uincoming[r]: incoming channel for broadcasting/delivering updates at r \in Replica
    buset       \* buset[r]: the buffer of local updates made by r \in Replica since the last broadcast 

nVars == <<incoming, lmsg, vc>>
secVars == <<uset, uincoming, buset>> 
vars == <<aset, abuf, rbuf, seq, nVars, secVars>>   
-----------------------------------------------------------------------------
Msg == [aid : Aid, abuf : SUBSET Element, rbuf: SUBSET Element, lvc : [Replica -> Nat]]
Network == INSTANCE ReliableCausalNetwork \* WITH incoming <- incoming, lmsg <- lmsg, vc <- vc                                               
 
ReadOpAWSet(r) == {ele.d: ele \in aset[r]}   \* read the state of r\in Replica                                                     
SEC == INSTANCE OpSEC \* WITH uset <- uset, uincoming <- uincoming, buset <- buset                                        
-----------------------------------------------------------------------------
TypeOK == 
    /\aset \in [Replica -> SUBSET Element]
    /\abuf \in [Replica -> SUBSET Element]
    /\rbuf \in [Replica -> SUBSET Element]
    /\IntTypeOK
    \*/\Network!SMTypeOK
    /\SEC!SECTypeOK
-----------------------------------------------------------------------------
Init ==   
    /\ aset = [r \in Replica |-> {}] 
    /\ abuf = [r \in Replica |-> {}]
    /\ rbuf = [r \in Replica |-> {}]
    /\ IntInit
    /\ Network!RCNInit
    /\ SEC!OpSECInit    
(*
1
1
1
*) 
-----------------------------------------------------------------------------
Add(d, r) ==  \* r\in Replica adds d \in Data
    /\ LET e == [aid |-> [r |-> r, seq |-> seq[r]], d |-> d]
       IN /\ aset' = [aset EXCEPT ![r] = @ \union {e}] 
          /\ abuf' = [abuf EXCEPT ![r] = @ \union {e}] 
    /\ IntDo(r)
    /\ SEC!OpSECDo(r)
    /\ UNCHANGED <<rbuf, nVars>>     

Remove(d, r) ==  \* r\in Replica removes d \in Data
    /\ LET E == {ele \in aset[r] : ele.d = d}  \* E may be empty
       IN /\  aset' = [aset EXCEPT ![r] = @ \ E]  
          /\  rbuf' = [rbuf EXCEPT ![r] = @ \cup E]  
    /\ IntDo(r)
    /\ SEC!OpSECDo(r)
    /\ UNCHANGED <<abuf, nVars>>  
    
Do(r) ==  \* We ignore ReadOpAWSet(r) since it does not modify states.
    \E d \in Data : Add(d, r) \/ Remove(d, r)        
-----------------------------------------------------------------------------                                    
Send(r) ==  \* r\in Replica sends a message 
    /\ \/ abuf[r] # {}
       \/ rbuf[r] # {}
    /\ abuf' = [abuf EXCEPT ![r] = {}]
    /\ rbuf' = [rbuf EXCEPT ![r] = {}]
    /\ Network!RCNBroadcast(r, [aid |-> [r |-> r, seq |-> seq[r]], 
                                abuf|-> abuf[r], rbuf|-> rbuf[r]])
    /\ SEC!OpSECSend(r)
    /\ IntSend(r)
    /\ UNCHANGED <<aset>>  
              
Deliver(r) ==  \* r\in Replica delivers a message (lmsg'[r]) 
    /\ Network!RCNDeliver(r)
    /\ SEC!OpSECDeliver(r, lmsg'[r].aid)
    /\ aset' = [aset EXCEPT ![r] = (@ \cup lmsg'[r].abuf) \ lmsg'[r].rbuf]
    /\ IntDeliver(r)
    /\ UNCHANGED <<abuf, rbuf>>    
-----------------------------------------------------------------------------
Next == \E r \in Replica: Do(r) \/ Send(r) \/ Deliver(r) 

Spec == Init /\ [][Next]_vars  
=============================================================================
\* Modification History
\* Last modified Wed Jun 26 13:18:00 CST 2019 by xhdn
\* Created Fri May 24 14:12:26 CST 2019 by xhdn
