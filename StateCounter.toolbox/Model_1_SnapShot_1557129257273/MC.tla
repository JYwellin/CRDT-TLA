---- MODULE MC ----
EXTENDS StateCounter, TLC

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
r1, r2, r3
----

\* MV CONSTANT definitions Replica
const_1557129249240244000 == 
{r1, r2, r3}
----

\* SYMMETRY definition
symm_1557129249240245000 == 
Permutations(const_1557129249240244000)
----

\* CONSTANT definition @modelParameterDefinitions:0
CONSTANT def_ov_1557129249240246000
----
=============================================================================
\* Modification History
\* Created Mon May 06 15:54:09 CST 2019 by jywellin
