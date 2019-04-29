----------------------------- MODULE Message ------------------------------
EXTENDS Naturals
-----------------------------------------------------------------------------
VARIABLES 
    messageset,
    updateset,
    last_updateset   
-----------------------------------------------------------------------------
CONSTANTS 
    Replica
-----------------------------------------------------------------------------    
Update == [r : Replica, seq : Nat]
Msgid(m) == [r |-> m.r, seq |-> m.seq] 
-----------------------------------------------------------------------------  
IfDeliverMsg(m, r) == Msgid(m) \in messageset[r]

OpUpdate(r) == updateset[r] \ last_updateset[r] \* for op-based CRDT
StateUpdate(r) == updateset[r]                  \* for state-based CRDT
-----------------------------------------------------------------------------
Minit == 
    /\ updateset = [r \in Replica |-> {}]
    /\ last_updateset = [r \in Replica |-> {}]
    /\ messageset = [r \in Replica |-> {}]

AddUpdate(r, seq) == 
    /\ updateset' = [updateset EXCEPT ![r] = @ \cup { [r |-> r, seq |-> seq ] }] 
    /\ UNCHANGED <<last_updateset, messageset>>  
    
DeliverMsg(r, m) ==
    /\ updateset' = [updateset EXCEPT ![r] = @ \cup m.update]    
    /\ last_updateset' = [last_updateset EXCEPT ![r] = @ \cup m.update]
    /\ messageset' = [messageset EXCEPT ![r] = @ \cup {Msgid(m)}] 

SendMsg(r) ==
    /\ last_updateset' = [last_updateset EXCEPT ![r] = updateset[r]]
    /\ UNCHANGED <<updateset, messageset>> 
-----------------------------------------------------------------------------    
Sameupdate(r1, r2) == 
    updateset[r1] = updateset[r2]
=============================================================================
\* Modification History
\* Last modified Mon Apr 29 16:54:34 CST 2019 by jywellin
\* Last modified Sun Apr 21 18:45:44 CST 2019 by xhdn
\* Created Sat Apr 20 22:31:38 CST 2019 by xhdn
