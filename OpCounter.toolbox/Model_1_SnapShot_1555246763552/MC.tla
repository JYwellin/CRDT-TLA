---- MODULE MC ----
EXTENDS OpCounter, TLC

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
r1, r2, r3
----

\* MV CONSTANT definitions Replica
const_155524676152914000 == 
{r1, r2, r3}
----

\* SYMMETRY definition
symm_155524676152915000 == 
Permutations(const_155524676152914000)
----

\* CONSTANT definition @modelParameterDefinitions:0
CONSTANT def_ov_155524676152916000
----
=============================================================================
\* Modification History
\* Created Sun Apr 14 20:59:21 CST 2019 by jywellin
