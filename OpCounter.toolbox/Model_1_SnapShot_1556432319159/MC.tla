---- MODULE MC ----
EXTENDS OpCounter, TLC

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
r1, r2, r3
----

\* MV CONSTANT definitions Replica
const_155643231113014000 == 
{r1, r2, r3}
----

\* SYMMETRY definition
symm_155643231113015000 == 
Permutations(const_155643231113014000)
----

\* CONSTANT definition @modelParameterDefinitions:0
CONSTANT def_ov_155643231113016000
----
=============================================================================
\* Modification History
\* Created Sun Apr 28 14:18:31 CST 2019 by jywellin
