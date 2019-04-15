---- MODULE MC ----
EXTENDS StateCounter, TLC

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
r1, r2, r3
----

\* MV CONSTANT definitions Replica
const_155532952109293000 == 
{r1, r2, r3}
----

\* SYMMETRY definition
symm_155532952109294000 == 
Permutations(const_155532952109293000)
----

\* CONSTANT definition @modelParameterDefinitions:0
CONSTANT def_ov_155532952109295000
----
=============================================================================
\* Modification History
\* Created Mon Apr 15 19:58:41 CST 2019 by jywellin
