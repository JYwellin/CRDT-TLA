----------------------------- MODULE StateAWSet -----------------------------
CONSTANTS
    Data    \* the set of data
-----------------------------------------------------------------------------
VARIABLES
    aset,     \* aset[r]: set of active Instance(s) maintained by r \in Replica
    tset      \* tset[r]: set of tombstone Instance(s) maintained by r \in Replica
    
Element == [d: Data, r: Replica, k: Nat]    \* the set of elements
----------------------------------------------------------------------------- 
Network == INSTANCE BasicNetwork     \* instance a basic network
-----------------------------------------------------------------------------
TypeOK == 
    /\ aset \in [Replica -> SUBSET Element]
    /\ tset \in [Replica -> SUBSET Element]
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
(*
next page
*)
Add(d, r) ==    \* r\in Replica add d \in Data
    aset'= [aset EXCEPT ![r] = @ \union {[d |-> d, r |-> r, k |-> seq[r]]}]

Remove(d, r) == \* r\in Replica remove d \in Data 
       LET E == {ele \in aset[r] : ele.d = d}
       IN  /\ aset' = [aset EXCEPT ![r] = @ \ E]
           /\ tset' = [tset EXCEPT ![r] = @ \cup E] 

Read(r) == \* read the state of r\in Replica
    {ele.d: ele \in aset[r]} 
                      
Do(r) ==  \* operations
    \E a \in Data: Add(a, r) \/ Remove(a, r)    
----------------------------------------------------------------------------- 
Send(r) ==      \* r\in Replica send a message 
    Network!NBroadcast(r,  [r |-> r, seq |-> seq[r], update |-> StateUpdate(r), A |-> aset[r], T |-> tset[r]])  
           
Receive(r) ==      \* r\in Replica receive a message 
    /\ Network!NDeliver(r)
    /\ tset' = [tset EXCEPT ![r] = @ \cup lmsg'.T]
    /\ aset' = [aset EXCEPT ![r] = (@ \cup lmsg'.A) \ tset'[r]]                
=============================================================================
\* Modification History
\* Last modified Mon Jun 10 02:28:39 CST 2019 by xhdn
\* Created Sun Jun 09 18:27:03 CST 2019 by xhdn
