---------------------------- MODULE StateCounter ----------------------------
EXTENDS Counter
CONSTANTS Read(_), InitMsg
-----------------------------------------------------------------------------
VARIABLES
    state,      \* state[r]: the state of r \in Replica
    (* variables for network: *) 
    incoming,  \* incoming[r]: incoming channel at replica r \in Replica
    lmsg,      \* lmsg[r]: the last message delivered at r \in Replica to the upper-layer protocol 
    (* variables for SEC: *) 
    uset,       \* uset[r]: the set of updates seen by replica r \in Replica
    uincoming   \* uincoming[r]: incoming channel for broadcasting/delivering updates at r \in Replica
    
nVars  == <<incoming, lmsg>>
secVars == <<uset, uincoming>> 
vars == <<state, seq, nVars, secVars>>
-----------------------------------------------------------------------------  
Msg == [aid : Aid, rstate : [Replica -> Nat] ]  
Network == INSTANCE BasicNetwork  \* WITH incoming <- incoming, lmsg <- lmsg     
                              
Max(a, b) == IF a > b THEN a ELSE b

ReadStateCounter(r) == state[r]  \* read the state of r\in Replica
SEC == INSTANCE StateSEC  \* WITH uset <- uset, uincoming <- uincoming                                         
----------------------------------------------------------------------------    
TypeOK ==
    /\state \in [Replica -> [Replica -> Nat]]
    /\IntTypeOK
    /\SEC!SECTypeOK
-----------------------------------------------------------------------------
Init == 
    /\ state = [r \in Replica |-> [s \in Replica |-> 0]]
    /\ IntInit  
    /\ Network!BNInit
    /\ SEC!StateSECInit
-----------------------------------------------------------------------------              
Inc(r) ==  
    /\ state' = [state EXCEPT ![r][r] = @ + 1]
    /\ IntDo(r)
    /\ SEC!StateSECDo(r)
    /\ UNCHANGED <<nVars>>
                         
Do(r) ==  Inc(r)\* We ignore ReadStateCounter(r) since it does not modify states.       
-----------------------------------------------------------------------------
Send(r) ==  \* r\in Replica sends a message 
    /\ Network!BNBroadcast(r, [aid |-> [r |-> r, seq |-> seq[r]], rstate |-> state[r]])  
    /\ IntSend(r)
    /\ SEC!StateSECSend(r) 
    /\ UNCHANGED <<state>>
           
Deliver(r) ==  \* r\in Replica delivers a message (lmsg'[r]) 
    /\ IntDeliver(r)
    /\ Network!BNDeliver(r)
    /\ SEC!StateSECDeliver(r, lmsg'[r].aid)
    /\ \A s \in Replica : state' = [state EXCEPT ![r][s] = Max(@, lmsg'[r].rstate[s])]    
    /\ UNCHANGED <<>> 
-----------------------------------------------------------------------------
Next == \E r \in Replica: Do(r) \/ Send(r) \/ Deliver(r)

Spec == Init /\ [][Next]_vars
=============================================================================
\* Modification History
\* Last modified Wed Jul 31 23:36:07 CST 2019 by xhdn
\* Created Thu Jul 25 16:38:48 CST 2019 by jywellin
