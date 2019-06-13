---------------------------- MODULE SystemModel ----------------------------
EXTENDS Bags
-----------------------------------------------------------------------------
CONSTANTS 
    Replica,  \* 副本节点集合
    Msg       \* 消息集合
    
NotMsg == CHOOSE m : m \notin Msg  
-----------------------------------------------------------------------------
VARIABLES incoming  \* incoming[r]：副本节点r用于接收消息的信道
-----------------------------------------------------------------------------
SMTypeOK == 
    \A r \in Replica : BagToSet(incoming[r]) \in SUBSET Msg  \* 每个副本节点的通信信道是一个多重集 (multiset, 使用Bag表示)
=============================================================================
\* Modification History
\* Last modified Thu Jun 06 15:56:45 CST 2019 by xhdn
\* Created Wed Jun 05 21:05:12 CST 2019 by xhdn
