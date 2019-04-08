---- MODULE MC ----
EXTENDS OpCounter, TLC

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
r1, r2, r3
----

\* MV CONSTANT definitions Replica
const_15547214055082000 == 
{r1, r2, r3}
----

\* SYMMETRY definition
symm_15547214055083000 == 
Permutations(const_15547214055082000)
----

\* CONSTANT definition @modelParameterDefinitions:0
CONSTANT def_ov_15547214055094000
----
=============================================================================
\* Modification History
\* Created Mon Apr 08 19:03:25 CST 2019 by jywellin
