---- MODULE MC ----
EXTENDS StateCounter, TLC

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
r1, r2
----

\* MV CONSTANT definitions Replica
const_155926214199229000 == 
{r1, r2}
----

\* SYMMETRY definition
symm_155926214199230000 == 
Permutations(const_155926214199229000)
----

\* CONSTANT definition @modelParameterDefinitions:0
CONSTANT def_ov_155926214199231000
----
\* CONSTRAINT definition @modelParameterContraint:0
constr_155926214199232000 ==
TLCSet("exit", TLCGet("distinct") > 10000)
----
=============================================================================
\* Modification History
\* Created Fri May 31 08:22:21 CST 2019 by zfwang
