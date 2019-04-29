---- MODULE MC ----
EXTENDS OptimizedAWSet, TLC

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
r1, r2, r3
----

\* MV CONSTANT definitions Replica
const_1556529425399209000 == 
{r1, r2, r3}
----

\* SYMMETRY definition
symm_1556529425399210000 == 
Permutations(const_1556529425399209000)
----

\* CONSTANT definitions @modelParameterConstants:0Data
const_1556529425399211000 == 
{"a","b","c"}
----

\* CONSTANT definition @modelParameterDefinitions:0
CONSTANT def_ov_1556529425399212000
----
=============================================================================
\* Modification History
\* Created Mon Apr 29 17:17:05 CST 2019 by jywellin
