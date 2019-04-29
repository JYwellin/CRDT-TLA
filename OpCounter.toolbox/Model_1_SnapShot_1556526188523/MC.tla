---- MODULE MC ----
EXTENDS OpCounter, TLC

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
r1, r2, r3
----

\* MV CONSTANT definitions Replica
const_1556526186507168000 == 
{r1, r2, r3}
----

\* SYMMETRY definition
symm_1556526186507169000 == 
Permutations(const_1556526186507168000)
----

\* CONSTANT definition @modelParameterDefinitions:0
CONSTANT def_ov_1556526186507170000
----
=============================================================================
\* Modification History
\* Created Mon Apr 29 16:23:06 CST 2019 by jywellin
