---- MODULE MC ----
EXTENDS OpCounter, TLC

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
r1, r2, r3
----

\* MV CONSTANT definitions Replica
const_1556526518312174000 == 
{r1, r2, r3}
----

\* SYMMETRY definition
symm_1556526518312175000 == 
Permutations(const_1556526518312174000)
----

\* CONSTANT definition @modelParameterDefinitions:0
CONSTANT def_ov_1556526518312176000
----
=============================================================================
\* Modification History
\* Created Mon Apr 29 16:28:38 CST 2019 by jywellin
