-------------------------- MODULE ReliableNetwork --------------------------
EXTENDS BasicNetwork, Message

Rvars == <<incoming, lmsg, dmsg>>
-----------------------------------------------------------------------------
RInit == /\ NInit
         /\ MInit

RBroadcast(r, m) == /\ NBroadcast(r, m)
                    /\ MBroadcast

RDeliver(r) == 
    /\ incoming[r] # EmptyBag
    /\ \E m \in BagToSet(incoming[r]):
        /\ ~ IfDeliverMsg(m, r) 
        /\ lmsg' = m
        /\ MDeliver(r, m)
    /\ UNCHANGED <<incoming>>     

RDo == UNCHANGED Rvars 
=============================================================================
\* Modification History
\* Last modified Sun Jun 09 20:28:26 CST 2019 by xhdn
\* Last modified Mon May 06 15:22:12 CST 2019 by jywellin
\* Created Wed Mar 27 16:45:34 CST 2019 by jywellin