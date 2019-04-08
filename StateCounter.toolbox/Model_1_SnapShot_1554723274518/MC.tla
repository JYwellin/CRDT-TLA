---- MODULE MC ----
EXTENDS StateCounter, TLC

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
r1, r2, r3
----

\* MV CONSTANT definitions Replica
const_155472327249721000 == 
{r1, r2, r3}
----

\* SYMMETRY definition
symm_155472327249722000 == 
Permutations(const_155472327249721000)
----

\* CONSTANT definition @modelParameterDefinitions:0
CONSTANT def_ov_155472327249723000
----
=============================================================================
\* Modification History
\* Created Mon Apr 08 19:34:32 CST 2019 by jywellin
