---- MODULE MC ----
EXTENDS OpCounter, TLC

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
r1, r2, r3
----

\* MV CONSTANT definitions Replica
const_15564322691418000 == 
{r1, r2, r3}
----

\* SYMMETRY definition
symm_15564322691419000 == 
Permutations(const_15564322691418000)
----

\* CONSTANT definition @modelParameterDefinitions:0
CONSTANT def_ov_155643226914110000
----
=============================================================================
\* Modification History
\* Created Sun Apr 28 14:17:49 CST 2019 by jywellin
