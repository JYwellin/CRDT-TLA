---- MODULE MC ----
EXTENDS OpCounter, TLC

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
r1, r2, r3
----

\* MV CONSTANT definitions Replica
const_155531400978959000 == 
{r1, r2, r3}
----

\* SYMMETRY definition
symm_155531400978960000 == 
Permutations(const_155531400978959000)
----

\* CONSTANT definition @modelParameterDefinitions:0
CONSTANT def_ov_155531400978961000
----
=============================================================================
\* Modification History
\* Created Mon Apr 15 15:40:09 CST 2019 by jywellin
