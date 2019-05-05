---- MODULE MC ----
EXTENDS StateCounter, TLC

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
r1, r2, r3
----

\* MV CONSTANT definitions Replica
const_15554150208892000 == 
{r1, r2, r3}
----

\* SYMMETRY definition
symm_15554150208893000 == 
Permutations(const_15554150208892000)
----

\* CONSTANT definition @modelParameterDefinitions:0
CONSTANT def_ov_15554150208894000
----
=============================================================================
\* Modification History
\* Created Tue Apr 16 19:43:40 CST 2019 by jywellin