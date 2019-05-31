---- MODULE MC ----
EXTENDS StateCounter, TLC

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
r1, r2
----

\* MV CONSTANT definitions Replica
const_1557970471149400000 == 
{r1, r2}
----

\* SYMMETRY definition
symm_1557970471149401000 == 
Permutations(const_1557970471149400000)
----

\* CONSTANT definition @modelParameterDefinitions:0
CONSTANT def_ov_1557970471149402000
----
=============================================================================
\* Modification History
\* Created Thu May 16 09:34:31 CST 2019 by zfwang
