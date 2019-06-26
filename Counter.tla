------------------------------ MODULE OpCounter ------------------------------
EXTENDS Naturals
CONSTANTS Replica  \* the set of replicas
-----------------------------------------------------------------------------
VARIABLES c,         \* c[r]: current value at r \in Replica
          d,         \* d[r]: buffer of increments at r \in Replica
          incoming   \* incoming[r]: incoming channel at replica r \in Replica
Msg == [d : Nat]  \* message type
vars == <<c, d, incoming>>
-----------------------------------------------------------------------------
TypeOK == 
    /\ c \in [Replica -> Nat]
    /\ d \in [Replica -> Nat]
    /\ incoming \in [Replica -> Msg]  \* each incoming channel is represented by a set of message
-----------------------------------------------------------------------------       
Init == 
    /\ c = [r \in Replica |-> 0]
    /\ d = [r \in Replica |-> 0]
    /\ incoming = [r \in Replica |-> {}]  
-----------------------------------------------------------------------------     
Read(r) == c[r]

Inc(r) == 
    /\ c' = [c EXCEPT ![r] = @ + 1]
    /\ d' = [d EXCEPT ![r] = @ + 1]
    /\ UNCHANGED <<incoming>>
    
Do(r) == Inc(r)  \* We ignore Read(r) since it does not modify states.
-----------------------------------------------------------------------------
Send(r) ==  
    /\ d[r] # 0
    /\ d' = [d EXCEPT ![r] = 0]
    /\ incoming' = [x \in Replica |-> IF x = r THEN incoming[x]
                                               ELSE incoming[x] \cup [ d-> d[r]] ]      
    /\ UNCHANGED <<c>>

Deliver(r) == 
    /\ incoming[r] # {}  
    /\ \E m \in incoming[r]:   \* choose m from incoming[r] non-deterministically 
        /\ c' = [c EXCEPT ![r] = @ + m.d]
        /\ incoming' = [incoming EXCEPT ![r] = @ \ {m}]  \* delete m
    /\ UNCHANGED <<d>>      
-----------------------------------------------------------------------------                
Next == \E r \in Replica: Do(r) \/ Send(r)\/ Deliver(r)                  
Spec == Init /\ [][Next]_vars   
=============================================================================
\* Modification History
\* Last modified Tue Jun 25 21:01:10 CST 2019 by xhdn
\* Created Thu Jun 20 22:50:11 CST 2019 by xhdn
