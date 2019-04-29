---- MODULE MC ----
EXTENDS StateCounter, TLC

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
r1, r2, r3
----

\* MV CONSTANT definitions Replica
const_1556531479393215000 == 
{r1, r2, r3}
----

\* SYMMETRY definition
symm_1556531479393216000 == 
Permutations(const_1556531479393215000)
----

\* CONSTANT definition @modelParameterDefinitions:0
CONSTANT def_ov_1556531479393217000
----
=============================================================================
\* Modification History
\* Created Mon Apr 29 17:51:19 CST 2019 by jywellin
