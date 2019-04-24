---- MODULE MC ----
EXTENDS OpCounter, TLC

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
r1, r2, r3
----

\* MV CONSTANT definitions Replica
const_15560961122122000 == 
{r1, r2, r3}
----

\* SYMMETRY definition
symm_15560961122123000 == 
Permutations(const_15560961122122000)
----

\* CONSTANT definition @modelParameterDefinitions:0
CONSTANT def_ov_15560961122124000
----
=============================================================================
\* Modification History
\* Created Wed Apr 24 16:55:12 CST 2019 by jywellin
