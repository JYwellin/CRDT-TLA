---- MODULE MC ----
EXTENDS RGA, TLC

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
r1, r2, r3
----

\* MV CONSTANT definitions Replica
const_1555420850550139000 == 
{r1, r2, r3}
----

\* SYMMETRY definition
symm_1555420850550140000 == 
Permutations(const_1555420850550139000)
----

\* CONSTANT definitions @modelParameterConstants:0Charnum
const_1555420850550141000 == 
5
----

\* CONSTANT definitions @modelParameterConstants:1Char
const_1555420850550142000 == 
{"a" ,"b" ,"c" ,"d" ,"e"}
----

\* CONSTANT definition @modelParameterDefinitions:0
CONSTANT def_ov_1555420850550143000
----
=============================================================================
\* Modification History
\* Created Tue Apr 16 21:20:50 CST 2019 by jywellin
