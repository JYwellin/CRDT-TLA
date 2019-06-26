----------------------- MODULE ReliableCausalNetwork -----------------------
EXTENDS CausalNetwork
  
rcnVars == <<incoming, lmsg, vc>>
-----------------------------------------------------------------------------
RCNInit == CNInit

RCNBroadcast(r, m) == CNBroadcast(r, m)

RCNCausallyReady(r, cm) ==  \* whether cm is causally ready to be delivered by r \in Replica
    LET mr == sender(cm)  \* cm : message with vector clock
    IN  /\ ts(cm)[mr] = vc[r][mr] + 1  \* no message duplication
        /\ \A s \in Replica \ {mr}: ts(cm)[s] <= vc[r][s] 
                   
RCNDeliver(r) == 
    /\ incoming[r] # {}
    /\ \E cm \in incoming[r]: 
         /\ RCNCausallyReady(r, cm)
         /\ LET mr == sender(cm) 
            IN  vc' = [vc EXCEPT ![r][mr] = ts(cm)[mr]]  \* update vc[r]
         /\ lmsg' = [lmsg EXCEPT ![r] = cm.m]
         /\ incoming' = [incoming EXCEPT ![r] = @ \ {cm}]   \* delete cm 
=============================================================================
\* Modification History
\* Last modified Wed Jun 26 19:23:25 CST 2019 by xhdn
\* Last modified Mon May 06 16:07:42 CST 2019 by jywellin
\* Created Tue Apr 02 15:26:19 CST 2019 by jywellin
