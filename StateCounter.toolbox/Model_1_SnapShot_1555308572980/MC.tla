---- MODULE MC ----
EXTENDS StateCounter, TLC

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
r1, r2, r3
----

\* MV CONSTANT definitions Replica
const_155530856091636000 == 
{r1, r2, r3}
----

\* SYMMETRY definition
symm_155530856091637000 == 
Permutations(const_155530856091636000)
----

\* CONSTANT definition @modelParameterDefinitions:0
CONSTANT def_ov_155530856091638000
----
=============================================================================
\* Modification History
\* Created Mon Apr 15 14:09:20 CST 2019 by jywellin
