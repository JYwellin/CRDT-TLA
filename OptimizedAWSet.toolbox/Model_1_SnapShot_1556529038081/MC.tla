---- MODULE MC ----
EXTENDS OptimizedAWSet, TLC

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
r1, r2, r3
----

\* MV CONSTANT definitions Replica
const_1556529036057197000 == 
{r1, r2, r3}
----

\* SYMMETRY definition
symm_1556529036057198000 == 
Permutations(const_1556529036057197000)
----

\* CONSTANT definitions @modelParameterConstants:0Data
const_1556529036057199000 == 
{"a","b","c"}
----

\* CONSTANT definition @modelParameterDefinitions:0
CONSTANT def_ov_1556529036057200000
----
=============================================================================
\* Modification History
\* Created Mon Apr 29 17:10:36 CST 2019 by jywellin
