---- MODULE MC ----
EXTENDS OpCounter, TLC

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
r1, r2, r3
----

\* MV CONSTANT definitions Replica
const_1557128580517226000 == 
{r1, r2, r3}
----

\* SYMMETRY definition
symm_1557128580517227000 == 
Permutations(const_1557128580517226000)
----

\* CONSTANT definition @modelParameterDefinitions:0
CONSTANT def_ov_1557128580517228000
----
=============================================================================
\* Modification History
\* Created Mon May 06 15:43:00 CST 2019 by jywellin
