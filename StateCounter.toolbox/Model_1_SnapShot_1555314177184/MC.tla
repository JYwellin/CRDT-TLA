---- MODULE MC ----
EXTENDS StateCounter, TLC

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
r1, r2, r3
----

\* MV CONSTANT definitions Replica
const_155531417515483000 == 
{r1, r2, r3}
----

\* SYMMETRY definition
symm_155531417515484000 == 
Permutations(const_155531417515483000)
----

\* CONSTANT definition @modelParameterDefinitions:0
CONSTANT def_ov_155531417515585000
----
=============================================================================
\* Modification History
\* Created Mon Apr 15 15:42:55 CST 2019 by jywellin
