---- MODULE MC ----
EXTENDS StateCounter, TLC

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
r1, r2, r3
----

\* MV CONSTANT definitions Replica
const_1557968135213262000 == 
{r1, r2, r3}
----

\* SYMMETRY definition
symm_1557968135213263000 == 
Permutations(const_1557968135213262000)
----

\* CONSTANT definition @modelParameterDefinitions:0
CONSTANT def_ov_1557968135213264000
----
=============================================================================
\* Modification History
\* Created Thu May 16 08:55:35 CST 2019 by zfwang
