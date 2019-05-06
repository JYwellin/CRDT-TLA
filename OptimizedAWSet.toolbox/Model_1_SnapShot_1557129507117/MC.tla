---- MODULE MC ----
EXTENDS OptimizedAWSet, TLC

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
r1, r2, r3
----

\* MV CONSTANT definitions Replica
const_1557129498074255000 == 
{r1, r2, r3}
----

\* SYMMETRY definition
symm_1557129498074256000 == 
Permutations(const_1557129498074255000)
----

\* CONSTANT definitions @modelParameterConstants:0Data
const_1557129498074257000 == 
{"a","b","c"}
----

\* CONSTANT definition @modelParameterDefinitions:0
CONSTANT def_ov_1557129498074258000
----
=============================================================================
\* Modification History
\* Created Mon May 06 15:58:18 CST 2019 by jywellin
