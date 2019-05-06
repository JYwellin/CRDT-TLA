---- MODULE MC ----
EXTENDS OptimizedAWSet, TLC

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
r1, r2, r3
----

\* MV CONSTANT definitions Replica
const_1557129458910249000 == 
{r1, r2, r3}
----

\* SYMMETRY definition
symm_1557129458910250000 == 
Permutations(const_1557129458910249000)
----

\* CONSTANT definitions @modelParameterConstants:0Data
const_1557129458910251000 == 
{"a","b","c"}
----

\* CONSTANT definition @modelParameterDefinitions:0
CONSTANT def_ov_1557129458911252000
----
=============================================================================
\* Modification History
\* Created Mon May 06 15:57:38 CST 2019 by jywellin
