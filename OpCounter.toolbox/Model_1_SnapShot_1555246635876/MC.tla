---- MODULE MC ----
EXTENDS OpCounter, TLC

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
r1, r2, r3
----

\* MV CONSTANT definitions Replica
const_15552466326788000 == 
{r1, r2, r3}
----

\* SYMMETRY definition
symm_15552466326789000 == 
Permutations(const_15552466326788000)
----

\* CONSTANT definition @modelParameterDefinitions:0
CONSTANT def_ov_155524663267810000
----
=============================================================================
\* Modification History
\* Created Sun Apr 14 20:57:12 CST 2019 by jywellin
