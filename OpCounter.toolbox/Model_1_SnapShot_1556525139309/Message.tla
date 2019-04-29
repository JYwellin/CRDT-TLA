----------------------------- MODULE Message ------------------------------
EXTENDS Naturals
-----------------------------------------------------------------------------
VARIABLES 
    updateset,
    last_updateset
   
-----------------------------------------------------------------------------
CONSTANTS 
    Replica
    
-----------------------------------------------------------------------------    
Update == [r : Replica, seq : Nat]

-----------------------------------------------------------------------------
Msgid(m) == [r |-> m.r, seq |-> m.seq] 
IfDeliverMsg(m, r) == Msgid(m) \in updateset[r]

OpUpdate(r) == updateset[r] \ last_updateset[r] \* for op-based CRDT
StateUpdate(r) == updateset[r] \* for state-based CRDT
-----------------------------------------------------------------------------
Minit == 
    /\ updateset = [r \in Replica |-> {}]
    /\ last_updateset = [r \in Replica |-> {}]

AddUpdate(r, seq) == 
    /\ updateset' = [updateset EXCEPT ![r] = @ \cup { [r |-> Replica, seq |-> seq ] }] 
    /\ UNCHANGED <<last_updateset>>  
    
DeliverMsg(r, m) ==
    /\ updateset' = [updateset EXCEPT ![r] = @ \cup m.update]    
    /\ last_updateset' = [last_updateset EXCEPT ![r] = @ \cup m.update]

SendMsg(r) ==
    /\ last_updateset' = [last_updateset EXCEPT ![r] = updateset[r]]
    /\ UNCHANGED <<updateset>> 
-----------------------------------------------------------------------------    
Sameupdate(r1, r2) == 
    updateset[r2] = updateset[r2]
=============================================================================
\* Modification History
\* Last modified Mon Apr 29 16:04:02 CST 2019 by jywellin
\* Last modified Sun Apr 21 18:45:44 CST 2019 by xhdn
\* Created Sat Apr 20 22:31:38 CST 2019 by xhdn
