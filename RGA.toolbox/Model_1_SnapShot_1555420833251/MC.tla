---- MODULE MC ----
EXTENDS RGA, TLC

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
r1, r2, r3
----

\* MV CONSTANT definitions Replica
const_1555420831224132000 == 
{r1, r2, r3}
----

\* SYMMETRY definition
symm_1555420831224133000 == 
Permutations(const_1555420831224132000)
----

\* CONSTANT definitions @modelParameterConstants:0Charnum
const_1555420831224134000 == 
5
----

\* CONSTANT definitions @modelParameterConstants:1Char
const_1555420831224135000 == 
{"a" ,"b" ,"c" ,"d" ,"e"}
----

\* CONSTANT definition @modelParameterDefinitions:0
CONSTANT def_ov_1555420831224136000
----
=============================================================================
\* Modification History
\* Created Tue Apr 16 21:20:31 CST 2019 by jywellin
