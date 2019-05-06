----------------------------- MODULE Message ------------------------------
EXTENDS Naturals
-----------------------------------------------------------------------------
VARIABLES 
    messageset
-----------------------------------------------------------------------------
CONSTANTS 
    Replica
-----------------------------------------------------------------------------    
Msgid(m) == [r |-> m.r, seq |-> m.seq] 
-----------------------------------------------------------------------------  
IfDeliverMsg(m, r) == Msgid(m) \in messageset[r]
-----------------------------------------------------------------------------
Minit == 
     messageset = [r \in Replica |-> {}]
     
MBroadcast == UNCHANGED <<messageset>> 
  
MDeliver(r, m) ==
     messageset' = [messageset EXCEPT ![r] = @ \cup {Msgid(m)}] 
=============================================================================
\* Modification History
\* Last modified Mon May 06 15:29:41 CST 2019 by jywellin
\* Last modified Sun Apr 21 18:45:44 CST 2019 by xhdn
\* Created Sat Apr 20 22:31:38 CST 2019 by xhdn
