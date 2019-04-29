---- MODULE MC ----
EXTENDS OptimizedAWSet, TLC

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
r1, r2, r3
----

\* MV CONSTANT definitions Replica
const_155651939138075000 == 
{r1, r2, r3}
----

\* SYMMETRY definition
symm_155651939138076000 == 
Permutations(const_155651939138075000)
----

\* CONSTANT definitions @modelParameterConstants:0Data
const_155651939138077000 == 
{"a","b","c"}
----

\* CONSTANT definition @modelParameterDefinitions:0
CONSTANT def_ov_155651939138078000
----
=============================================================================
\* Modification History
\* Created Mon Apr 29 14:29:51 CST 2019 by jywellin
