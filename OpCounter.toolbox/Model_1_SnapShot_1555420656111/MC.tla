---- MODULE MC ----
EXTENDS OpCounter, TLC

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
r1, r2, r3
----

\* MV CONSTANT definitions Replica
const_1555420654088126000 == 
{r1, r2, r3}
----

\* SYMMETRY definition
symm_1555420654088127000 == 
Permutations(const_1555420654088126000)
----

\* CONSTANT definition @modelParameterDefinitions:0
CONSTANT def_ov_1555420654088128000
----
=============================================================================
\* Modification History
\* Created Tue Apr 16 21:17:34 CST 2019 by jywellin
