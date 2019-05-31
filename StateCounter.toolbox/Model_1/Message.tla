----------------------------- MODULE Message ------------------------------
EXTENDS Naturals
-----------------------------------------------------------------------------
CONSTANT 
    Replica
VARIABLE 
    messageSet
-----------------------------------------------------------------------------    
Msgid(m) == [r |-> m.r, seq |-> m.seq] 
-----------------------------------------------------------------------------  
IfDeliverMsg(m, r) == Msgid(m) \in messageSet[r]
-----------------------------------------------------------------------------
Minit == messageSet = [r \in Replica |-> {}]
     
MBroadcast == UNCHANGED <<messageSet>> 
  
MDeliver(r, m) ==
     messageSet' = [messageSet EXCEPT ![r] = @ \cup {Msgid(m)}] 
=============================================================================
\* Modification History
\* Last modified Tue May 14 15:14:22 CST 2019 by zfwang
\* Last modified Mon May 06 15:29:41 CST 2019 by jywellin
\* Last modified Sun Apr 21 18:45:44 CST 2019 by xhdn
\* Created Sat Apr 20 22:31:38 CST 2019 by xhdn
