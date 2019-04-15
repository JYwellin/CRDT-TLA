---- MODULE MC ----
EXTENDS StateCounter, TLC

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
r1, r2, r3
----

\* MV CONSTANT definitions Replica
const_15553066731448000 == 
{r1, r2, r3}
----

\* SYMMETRY definition
symm_15553066731449000 == 
Permutations(const_15553066731448000)
----

\* CONSTANT definition @modelParameterDefinitions:0
CONSTANT def_ov_155530667314410000
----
=============================================================================
\* Modification History
\* Created Mon Apr 15 13:37:53 CST 2019 by jywellin
