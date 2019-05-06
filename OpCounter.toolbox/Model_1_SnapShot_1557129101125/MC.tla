---- MODULE MC ----
EXTENDS OpCounter, TLC

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
r1, r2, r3
----

\* MV CONSTANT definitions Replica
const_1557129094079238000 == 
{r1, r2, r3}
----

\* SYMMETRY definition
symm_1557129094079239000 == 
Permutations(const_1557129094079238000)
----

\* CONSTANT definition @modelParameterDefinitions:0
CONSTANT def_ov_1557129094079240000
----
=============================================================================
\* Modification History
\* Created Mon May 06 15:51:34 CST 2019 by jywellin
