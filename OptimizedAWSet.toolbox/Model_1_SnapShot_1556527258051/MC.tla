---- MODULE MC ----
EXTENDS OptimizedAWSet, TLC

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
r1, r2, r3
----

\* MV CONSTANT definitions Replica
const_1556527244998186000 == 
{r1, r2, r3}
----

\* SYMMETRY definition
symm_1556527244998187000 == 
Permutations(const_1556527244998186000)
----

\* CONSTANT definitions @modelParameterConstants:0Data
const_1556527244998188000 == 
{"a","b","c"}
----

\* CONSTANT definition @modelParameterDefinitions:0
CONSTANT def_ov_1556527244998189000
----
=============================================================================
\* Modification History
\* Created Mon Apr 29 16:40:44 CST 2019 by jywellin
