------------------------------- MODULE AWSet -------------------------------
EXTENDS CRDTInterface
----------------------------------------------------------------------------- 
CONSTANTS Data                   \* the set of data
Element == [aid : Aid, d: Data]  \* the set of elements
=============================================================================
\* Modification History
\* Last modified Tue Jun 25 20:07:27 CST 2019 by xhdn
\* Created Wed Jun 12 17:15:47 CST 2019 by xhdn
