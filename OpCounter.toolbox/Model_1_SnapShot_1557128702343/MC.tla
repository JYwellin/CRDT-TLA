---- MODULE MC ----
EXTENDS OpCounter, TLC

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
r1, r2, r3
----

\* MV CONSTANT definitions Replica
const_1557128700324232000 == 
{r1, r2, r3}
----

\* SYMMETRY definition
symm_1557128700324233000 == 
Permutations(const_1557128700324232000)
----

\* CONSTANT definition @modelParameterDefinitions:0
CONSTANT def_ov_1557128700324234000
----
=============================================================================
\* Modification History
\* Created Mon May 06 15:45:00 CST 2019 by jywellin
