---- MODULE MC ----
EXTENDS OptimizedAWSet, TLC

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
r1, r2, r3
----

\* MV CONSTANT definitions Replica
const_155652091919696000 == 
{r1, r2, r3}
----

\* SYMMETRY definition
symm_155652091919697000 == 
Permutations(const_155652091919696000)
----

\* CONSTANT definitions @modelParameterConstants:0Data
const_155652091919698000 == 
{"a","b","c"}
----

\* CONSTANT definition @modelParameterDefinitions:0
CONSTANT def_ov_155652091919699000
----
=============================================================================
\* Modification History
\* Created Mon Apr 29 14:55:19 CST 2019 by jywellin
