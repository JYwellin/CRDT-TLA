------------------------------ MODULE OpBasedCounter ------------------------------
EXTENDS Naturals
CONSTANTS Replica  \* the set of replicas
-----------------------------------------------------------------------------
VARIABLES c,         \* c[r]: current value at r \in Replica
          d,         \* d[r]: buffer of increments at r \in Replica
          incoming,  \* incoming[r]: incoming channel at replica r \in Replica
          seq        \* seq[r]: local sequence number for messages sent by r \in Replica
Msg == [r : Replica, seq : Nat, d : Nat]  \* message type
vars == <<c, d, incoming, seq>>
-----------------------------------------------------------------------------
TypeOK == /\ c \in [Replica -> Nat]
          /\ d \in [Replica -> Nat]
          /\ incoming \in [Replica -> SUBSET Msg]
          /\ seq \in [Replica -> Nat]
-----------------------------------------------------------------------------       
Init == /\ c = [r \in Replica |-> 0]
        /\ d = [r \in Replica |-> 0]
        /\ incoming = [r \in Replica |-> {}]
        /\ seq = [r \in Replica |-> 0]
-----------------------------------------------------------------------------     
Read(r) == c[r]
Inc(r) == /\ c' = [c EXCEPT ![r] = @ + 1]
          /\ d' = [d EXCEPT ![r] = @ + 1]
          /\ UNCHANGED <<incoming, seq>>    
Do(r) == Inc(r)  \* We ignore Read(r) since it does not modify states.
-----------------------------------------------------------------------------
Send(r) ==  
    /\ d[r] # 0
    /\ d' = [d EXCEPT ![r] = 0]
    /\ seq' = [seq EXCEPT ![r] = @ + 1]
    /\ LET m == [r |-> r,seq |-> seq[r], d |-> d[r]] 
       IN incoming' = [x \in Replica |-> IF x = r THEN incoming[x]
                                                  ELSE incoming[x] \cup {m}]      
    /\ UNCHANGED <<c>>
Deliver(r) == 
    /\incoming[r] # {}  
    /\\E m \in incoming[r]:   \* choose m from incoming[r] non-deterministically 
        /\ c' = [c EXCEPT ![r] = @ + m.d]
        /\ incoming' = [incoming EXCEPT ![r] = @ \ {m}]  \* delete m
    /\UNCHANGED <<d, seq>>      
-----------------------------------------------------------------------------                
Next == \E r \in Replica: Do(r) \/ Send(r)\/ Deliver(r)                  
Spec == Init /\ [][Next]_vars   
=============================================================================
\* Modification History
\* Last modified Sun Jun 30 19:47:07 CST 2019 by xhdn
\* Created Thu Jun 20 22:50:11 CST 2019 by xhdn
