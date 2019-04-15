---- MODULE MC ----
EXTENDS OpCounter, TLC

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
r1, r2, r3
----

\* MV CONSTANT definitions Replica
const_155531413344777000 == 
{r1, r2, r3}
----

\* SYMMETRY definition
symm_155531413344778000 == 
Permutations(const_155531413344777000)
----

\* CONSTANT definition @modelParameterDefinitions:0
CONSTANT def_ov_155531413344779000
----
=============================================================================
\* Modification History
\* Created Mon Apr 15 15:42:13 CST 2019 by jywellin
