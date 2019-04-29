---- MODULE MC ----
EXTENDS OptimizedAWSet, TLC

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
r1, r2, r3
----

\* MV CONSTANT definitions Replica
const_155651929832365000 == 
{r1, r2, r3}
----

\* SYMMETRY definition
symm_155651929832366000 == 
Permutations(const_155651929832365000)
----

\* CONSTANT definitions @modelParameterConstants:0Data
const_155651929832367000 == 
{"a","b","c"}
----

\* CONSTANT definition @modelParameterDefinitions:0
CONSTANT def_ov_155651929832368000
----
=============================================================================
\* Modification History
\* Created Mon Apr 29 14:28:18 CST 2019 by jywellin
