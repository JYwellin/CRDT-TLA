---- MODULE MC ----
EXTENDS OptimizedAWSet, TLC

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
r1, r2, r3
----

\* MV CONSTANT definitions Replica
const_155651935423670000 == 
{r1, r2, r3}
----

\* SYMMETRY definition
symm_155651935423671000 == 
Permutations(const_155651935423670000)
----

\* CONSTANT definitions @modelParameterConstants:0Data
const_155651935423672000 == 
{"a","b","c"}
----

\* CONSTANT definition @modelParameterDefinitions:0
CONSTANT def_ov_155651935423673000
----
=============================================================================
\* Modification History
\* Created Mon Apr 29 14:29:14 CST 2019 by jywellin
