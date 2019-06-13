------------------------------- MODULE OpAWSet -------------------------------
CONSTANTS
    Data    \* the set of data
-----------------------------------------------------------------------------
VARIABLES
    set,            \* set[r]: set of active Element(s) maintained by r \in Replica
    abuf,           \* abuf[r]: buffer of Element(s) added maintained by r \in Replica
    rbuf            \* rbuf[r]: buffer of Element(s) removed maintained by r \in Replica
    
Element == [d: Data, r: Replica, k: Nat]    \* the set of elements
----------------------------------------------------------------------------- 
Network == INSTANCE ReliableCausalNetwork     \* instance a reliable causal network
-----------------------------------------------------------------------------
TypeOK == 
    /\ set \in [Replica -> SUBSET Element]
    /\ abuf \in [Replica -> SUBSET Element]
    /\ rbuf \in [Replica -> SUBSET Element]
-----------------------------------------------------------------------------       
Init == ...    \* initial state
-----------------------------------------------------------------------------                                    
Send(r) == ...      \* r\in Replica send a message             
Receive(r) == ...   \* r\in Replica receive a message    
-----------------------------------------------------------------------------
Add(d, r) == ...    \* r\in Replica add d \in Data
Remove(d, r) == ... \* r\in Replica remove d \in Data   
    
Do(r) ==    \* operations
    \E d \in Data : Add(d, r) \/ Remove(d, r)         
-----------------------------------------------------------------------------
Next ==     \* next-state relation
    \E r \in Replica: Receive(r) \/ Send(r) \/ Do(r)

Spec == Init /\ [][Next]_vars   \* specification
-----------------------------------------------------------------------------
(*1
1
1
1
1
1
1
1
1
1
1
1





*)
Add(d, r) ==    \* r\in Replica add d \in Data
    /\ set' = [set EXCEPT ![r] = @ \union {[d |-> d, r |-> r, k |-> seq[r]]}] 
    /\ abuf'= [abuf EXCEPT ![r] = @ \union {[d |-> d, r |-> r, k |-> seq[r]]}]    

Remove(d, r) == \* r\in Replica remove d \in Data
    /\ {ele \in set[r] : ele.d = d} # {}
    /\ LET E == {ele \in set[r] : ele.d = d}
       IN /\  set' = [set EXCEPT ![r] = @ \ E]  
          /\  rbuf' = [rbuf EXCEPT ![r] = @ \cup E]  

Read(r) ==  \* read the state of r\in Replica
    {ele.d: ele \in set[r]}   
    
Do(r) ==  \* operations
    \E d \in Data : Add(d, r) \/ Remove(d, r) 
-----------------------------------------------------------------------------
Send(r) ==      \* r\in Replica send a message 
    /\ Network!RCBroadcast(r, [r |-> r, seq |-> seq[r], update|-> OpUpdate(r), 
                   vc |-> [vc EXCEPT ![r][r] = @ + 1][r], abuf|-> abuf[r], rbuf|-> rbuf[r] ])
    /\ abuf' = [abuf EXCEPT ![r] = {}]
    /\ rbuf' = [rbuf EXCEPT ![r] = {}]

              
Receive(r) ==    \* r\in Replica receive a message 
    /\ Network!RCDeliver(r)
    /\ set' = [set EXCEPT ![r] = (@ \cup lmsg'.abuf) \ lmsg'.rbuf]  
=============================================================================
\* Modification History
\* Last modified Wed Jun 12 15:52:57 CST 2019 by xhdn
\* Created Mon Jun 10 00:18:41 CST 2019 by xhdn
