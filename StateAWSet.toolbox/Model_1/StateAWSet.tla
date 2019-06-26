----------------------------- MODULE StateAWSet -----------------------------
EXTENDS AWSet
CONSTANTS Read(_)
-----------------------------------------------------------------------------
VARIABLES
    aset,      \* aset[r]: the set of active elements maintained by r \in Replica
    tset,      \* tset[r]: the set of tombstone elements maintained by r \in Replica 
    (* variables for network: *) 
    incoming,  \* incoming[r]: incoming channel at replica r \in Replica
    lmsg,      \* lmsg[r]: the last message delivered at r \in Replica to the upper-layer protocol 
    (* variables for SEC: *) 
    uset,       \* uset[r]: the set of updates seen by replica r \in Replica
    uincoming   \* uincoming[r]: incoming channel for broadcasting/delivering updates at r \in Replica
    
nVars  == <<incoming, lmsg>>
secVars == <<uset, uincoming>> 
vars == <<aset, tset, seq, nVars, secVars>>
-----------------------------------------------------------------------------  
Msg == [aid : Aid, A: SUBSET Element, T : SUBSET Element]  
Network == INSTANCE BasicNetwork  \* WITH incoming <- incoming, lmsg <- lmsg                                   

ReadStateAWSet(r) == {ele.d: ele \in aset[r]}  \* read the state of r\in Replica
SEC == INSTANCE StateSEC  \* WITH uset <- uset, uincoming <- uincoming                                         
-----------------------------------------------------------------------------    
TypeOK ==
    /\aset \in [Replica -> SUBSET Element]
    /\tset \in [Replica -> SUBSET Element]
    /\IntTypeOK
    /\Network!SMTypeOK
    /\SEC!SECTypeOK
-----------------------------------------------------------------------------
Init == 
    /\ aset = [r \in Replica |-> {}]
    /\ tset = [r \in Replica |-> {}]   
    /\ Network!BNInit
    /\ SEC!StateSECInit
    /\ IntInit     
-----------------------------------------------------------------------------  
(*
1
1
1
1
1
1
1
*)                
Add(d, r) ==  \* r\in Replica adds d \in Data
    /\ aset'= [aset EXCEPT ![r] = @ \union {[aid |-> [r |-> r, seq |-> seq[r]], d |-> d]}]
    /\ IntDo(r)
    /\ SEC!StateSECDo(r)
    /\ UNCHANGED <<tset, nVars>>
    
Remove(d, r) ==  \* r\in Replica removes d \in Data 
    /\ LET E == {ele \in aset[r] : ele.d = d}  \* E may be empty
       IN  /\ aset' = [aset EXCEPT ![r] = @ \ E]
           /\ tset' = [tset EXCEPT ![r] = @ \cup E] 
    /\ IntDo(r)
    /\ SEC!StateSECDo(r) 
    /\ UNCHANGED <<nVars>>
                      
Do(r) ==  \* We ignore ReadStateAWSet(r) since it does not modify states.
    \E a \in Data: Add(a, r) \/ Remove(a, r)         
-----------------------------------------------------------------------------
Send(r) ==  \* r\in Replica sends a message 
    /\ Network!BNBroadcast(r, [aid |-> [r |-> r, seq |-> seq[r]],  
                                 A |-> aset[r], T |-> tset[r]])  
    /\ IntSend(r)
    /\ SEC!StateSECSend(r) 
    /\ UNCHANGED <<aset, tset>>
           
Deliver(r) ==  \* r\in Replica delivers a message (lmsg'[r]) 
    /\ Network!BNDeliver(r)
    /\ IntDeliver(r)
    /\ SEC!StateSECDeliver(r, lmsg'[r].aid)
    /\ tset' = [tset EXCEPT ![r] = @ \cup lmsg'[r].T]
    /\ aset' = [aset EXCEPT ![r] = (@ \cup lmsg'[r].A) \ tset'[r]]           
    /\ UNCHANGED <<>> 
-----------------------------------------------------------------------------
Next == \E r \in Replica: Do(r) \/ Send(r) \/ Deliver(r)

Spec == Init /\ [][Next]_vars
=============================================================================
\* Modification History
\* Last modified Wed Jun 26 13:12:23 CST 2019 by xhdn
\* Created Fri May 24 14:13:38 CST 2019 by xhdn
