---- MODULE MC ----
EXTENDS OptimizedAWSet, TLC

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
r1, r2, r3
----

\* MV CONSTANT definitions Replica
const_1556545622862220000 == 
{r1, r2, r3}
----

\* SYMMETRY definition
symm_1556545622862221000 == 
Permutations(const_1556545622862220000)
----

\* CONSTANT definitions @modelParameterConstants:0Data
const_1556545622862222000 == 
{"a","b","c"}
----

\* CONSTANT definition @modelParameterDefinitions:0
CONSTANT def_ov_1556545622862223000
----
=============================================================================
\* Modification History
\* Created Mon Apr 29 21:47:02 CST 2019 by jywellin
