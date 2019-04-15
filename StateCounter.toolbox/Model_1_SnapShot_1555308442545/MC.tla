---- MODULE MC ----
EXTENDS StateCounter, TLC

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
r1, r2, r3
----

\* MV CONSTANT definitions Replica
const_155530839339331000 == 
{r1, r2, r3}
----

\* SYMMETRY definition
symm_155530839339332000 == 
Permutations(const_155530839339331000)
----

\* CONSTANT definition @modelParameterDefinitions:0
CONSTANT def_ov_155530839339333000
----
=============================================================================
\* Modification History
\* Created Mon Apr 15 14:06:33 CST 2019 by jywellin
