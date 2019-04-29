---- MODULE MC ----
EXTENDS OptimizedAWSet, TLC

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
r1, r2, r3
----

\* MV CONSTANT definitions Replica
const_155651902226160000 == 
{r1, r2, r3}
----

\* SYMMETRY definition
symm_155651902226161000 == 
Permutations(const_155651902226160000)
----

\* CONSTANT definitions @modelParameterConstants:0Data
const_155651902226162000 == 
{"a","b","c"}
----

\* CONSTANT definition @modelParameterDefinitions:0
CONSTANT def_ov_155651902226163000
----
=============================================================================
\* Modification History
\* Created Mon Apr 29 14:23:42 CST 2019 by jywellin
