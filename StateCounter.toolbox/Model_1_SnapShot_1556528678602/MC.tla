---- MODULE MC ----
EXTENDS StateCounter, TLC

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
r1, r2, r3
----

\* MV CONSTANT definitions Replica
const_1556528676573192000 == 
{r1, r2, r3}
----

\* SYMMETRY definition
symm_1556528676573193000 == 
Permutations(const_1556528676573192000)
----

\* CONSTANT definition @modelParameterDefinitions:0
CONSTANT def_ov_1556528676573194000
----
=============================================================================
\* Modification History
\* Created Mon Apr 29 17:04:36 CST 2019 by jywellin
