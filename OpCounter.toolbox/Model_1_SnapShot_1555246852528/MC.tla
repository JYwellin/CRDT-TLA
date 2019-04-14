---- MODULE MC ----
EXTENDS OpCounter, TLC

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
r1, r2, r3
----

\* MV CONSTANT definitions Replica
const_155524684447926000 == 
{r1, r2, r3}
----

\* SYMMETRY definition
symm_155524684447927000 == 
Permutations(const_155524684447926000)
----

\* CONSTANT definition @modelParameterDefinitions:0
CONSTANT def_ov_155524684447928000
----
=============================================================================
\* Modification History
\* Created Sun Apr 14 21:00:44 CST 2019 by jywellin
