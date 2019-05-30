----------------------------- MODULE Message ------------------------------
EXTENDS Naturals
-----------------------------------------------------------------------------
VARIABLES 
    messageset
-----------------------------------------------------------------------------
CONSTANTS 
    Replica
-----------------------------------------------------------------------------    
Sid(m) == [r |-> m.r, seq |-> m.seq] 
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
\* Last modified Thu May 30 19:50:30 CST 2019 by xhdn
\* Last modified Mon May 06 15:29:41 CST 2019 by jywellin
\* Created Sat Apr 20 22:31:38 CST 2019 by xhdn
