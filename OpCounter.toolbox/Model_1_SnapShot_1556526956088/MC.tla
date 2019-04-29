---- MODULE MC ----
EXTENDS OpCounter, TLC

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
r1, r2, r3
----

\* MV CONSTANT definitions Replica
const_1556526947045180000 == 
{r1, r2, r3}
----

\* SYMMETRY definition
symm_1556526947045181000 == 
Permutations(const_1556526947045180000)
----

\* CONSTANT definition @modelParameterDefinitions:0
CONSTANT def_ov_1556526947045182000
----
=============================================================================
\* Modification History
\* Created Mon Apr 29 16:35:47 CST 2019 by jywellin
