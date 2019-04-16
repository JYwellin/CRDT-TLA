---- MODULE MC ----
EXTENDS OpCounter, TLC

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
r1, r2, r3
----

\* MV CONSTANT definitions Replica
const_1555420208483106000 == 
{r1, r2, r3}
----

\* SYMMETRY definition
symm_1555420208483107000 == 
Permutations(const_1555420208483106000)
----

\* CONSTANT definition @modelParameterDefinitions:0
CONSTANT def_ov_1555420208483108000
----
=============================================================================
\* Modification History
\* Created Tue Apr 16 21:10:08 CST 2019 by jywellin
