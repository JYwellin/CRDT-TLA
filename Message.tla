----------------------------- MODULE Message ------------------------------
EXTENDS Naturals, SystemModel
-----------------------------------------------------------------------------
VARIABLES 
    dmsg
-----------------------------------------------------------------------------    
Aid(m) == [r |-> m.r, seq |-> m.seq] 
-----------------------------------------------------------------------------  
IfDeliverMsg(m, r) == Aid(m) \in dmsg[r]
-----------------------------------------------------------------------------
MInit == 
     dmsg = [r \in Replica |-> {}]
     
MBroadcast ==
     UNCHANGED <<dmsg>> 
  
MDeliver(r, m) ==
     dmsg' = [dmsg EXCEPT ![r] = @ \cup {Aid(m)}] 
=============================================================================
\* Modification History
\* Last modified Fri Jun 14 16:01:09 CST 2019 by xhdn
\* Last modified Mon May 06 15:29:41 CST 2019 by jywellin
\* Created Sat Apr 20 22:31:38 CST 2019 by xhdn
