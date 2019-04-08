---- MODULE MC ----
EXTENDS StateCounter, TLC

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
r1, r2, r3
----

\* MV CONSTANT definitions Replica
const_155472321522716000 == 
{r1, r2, r3}
----

\* SYMMETRY definition
symm_155472321522717000 == 
Permutations(const_155472321522716000)
----

\* CONSTANT definition @modelParameterDefinitions:0
CONSTANT def_ov_155472321522718000
----
=============================================================================
\* Modification History
\* Created Mon Apr 08 19:33:35 CST 2019 by jywellin
