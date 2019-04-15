---- MODULE MC ----
EXTENDS StateCounter, TLC

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
r1, r2, r3
----

\* MV CONSTANT definitions Replica
const_155531418824388000 == 
{r1, r2, r3}
----

\* SYMMETRY definition
symm_155531418824389000 == 
Permutations(const_155531418824388000)
----

\* CONSTANT definition @modelParameterDefinitions:0
CONSTANT def_ov_155531418824390000
----
=============================================================================
\* Modification History
\* Created Mon Apr 15 15:43:08 CST 2019 by jywellin
