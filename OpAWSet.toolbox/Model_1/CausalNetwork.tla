--------------------------- MODULE CausalNetwork ---------------------------
EXTENDS BasicNetwork, Naturals
-----------------------------------------------------------------------------
VARIABLES
    vc  \* vc[r][s] denotes the latest message from s \in Replica observed by r \in Replica  
    
cnVars == <<incoming, lmsg, vc>>
-----------------------------------------------------------------------------
ts(cm) == cm.lvc  \* timestamp (vector clock) for cm
sender(cm) == cm.m.aid.r  \* the replica that sends m
Max(a, b) == IF a > b THEN a ELSE b
-----------------------------------------------------------------------------    
CNTypeOK == 
    /\ SMTypeOK
    /\ vc = [r \in Replica |-> [Replica -> Nat]]  \* vc[r] : vector clock at r \in Replica
-----------------------------------------------------------------------------
CNInit == 
    /\ BNInit
    /\ vc = [r \in Replica |-> [s \in Replica |-> 0]]  \* \A r, s, vc[r][s] = 0 

CNBroadcast(r, m) == 
    /\ vc' = [vc EXCEPT ![r][r] = @ + 1]
    /\ LET cm == [m |-> m, lvc |-> vc'[r]] 
       IN  BNBroadcast(r, cm)
              
CNCausallyReady(r, cm) ==  \* whether m is causally ready to be delivered by r \in Replica
    LET mr == sender(cm.m) 
    IN  /\ ts(cm)[mr] <= vc[r][mr] + 1 
        /\ \A s \in Replica \ {mr}: ts(cm)[s] <= vc[r][s]  
                      
CNDeliver(r) == 
    /\ incoming[r] # {}
    /\ \E cm \in incoming[r]:        
         /\ CNCausallyReady(r, cm)
         /\ LET mr == sender(cm) 
            IN  vc' = [vc EXCEPT ![r][mr] = Max(@, ts(cm)[mr])]  \* update vc[r]
         /\ lmsg' = [lmsg EXCEPT ![r] = cm.m]
    /\ UNCHANGED <<incoming>>   
=============================================================================
\* Modification History
\* Last modified Tue Jun 25 22:41:54 CST 2019 by xhdn
\* Last modified Mon May 06 16:07:03 CST 2019 by jywellin
\* Created Wed Mar 27 20:03:44 CST 2019 by jywellin
