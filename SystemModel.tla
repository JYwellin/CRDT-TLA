---------------------------- MODULE SystemModel ----------------------------
CONSTANTS 
    Replica,  \* the set of replicas 
    Msg,      \* the set of messages
    InitMsg   \* special message for initialization 
-----------------------------------------------------------------------------
VARIABLES incoming  \* incoming[r]: incoming channel at replica r \in Replica
-----------------------------------------------------------------------------
SMTypeOK ==  \* each incoming channel is a set of messages
    incoming \in [Replica -> SUBSET Msg]
=============================================================================
\* Modification History
\* Last modified Wed Jun 26 20:45:21 CST 2019 by xhdn
\* Created Wed Jun 05 21:05:12 CST 2019 by xhdn
