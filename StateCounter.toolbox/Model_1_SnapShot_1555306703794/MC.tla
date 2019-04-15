---- MODULE MC ----
EXTENDS StateCounter, TLC

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
r1, r2, r3
----

\* MV CONSTANT definitions Replica
const_155530670176614000 == 
{r1, r2, r3}
----

\* SYMMETRY definition
symm_155530670176615000 == 
Permutations(const_155530670176614000)
----

\* CONSTANT definition @modelParameterDefinitions:0
CONSTANT def_ov_155530670176616000
----
=============================================================================
\* Modification History
\* Created Mon Apr 15 13:38:21 CST 2019 by jywellin
