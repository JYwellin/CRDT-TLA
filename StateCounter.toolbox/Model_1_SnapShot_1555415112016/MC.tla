---- MODULE MC ----
EXTENDS StateCounter, TLC

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
r1, r2, r3
----

\* MV CONSTANT definitions Replica
const_155541510295617000 == 
{r1, r2, r3}
----

\* SYMMETRY definition
symm_155541510295718000 == 
Permutations(const_155541510295617000)
----

\* CONSTANT definition @modelParameterDefinitions:0
CONSTANT def_ov_155541510295719000
----
=============================================================================
\* Modification History
\* Created Tue Apr 16 19:45:02 CST 2019 by jywellin
