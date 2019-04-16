---- MODULE MC ----
EXTENDS StateCounter, TLC

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
r1, r2, r3
----

\* MV CONSTANT definitions Replica
const_155541506549412000 == 
{r1, r2, r3}
----

\* SYMMETRY definition
symm_155541506549413000 == 
Permutations(const_155541506549412000)
----

\* CONSTANT definition @modelParameterDefinitions:0
CONSTANT def_ov_155541506549414000
----
=============================================================================
\* Modification History
\* Created Tue Apr 16 19:44:25 CST 2019 by jywellin
