------------------------------ MODULE AWSet ------------------------------
CONSTANTS
    Data    \* the set of data
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
=============================================================================
\* Modification History
\* Last modified Sun Jun 09 20:57:09 CST 2019 by xhdn
\* Created Sun Jun 09 18:27:03 CST 2019 by xhdn
