---- MODULE MC ----
EXTENDS RGA, TLC

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
r1, r2, r3
----

\* MV CONSTANT definitions Replica
const_1555420481465119000 == 
{r1, r2, r3}
----

\* SYMMETRY definition
symm_1555420481465120000 == 
Permutations(const_1555420481465119000)
----

\* CONSTANT definitions @modelParameterConstants:0Charnum
const_1555420481465121000 == 
5
----

\* CONSTANT definitions @modelParameterConstants:1Char
const_1555420481465122000 == 
{"a" ,"b" ,"c" ,"d" ,"e"}
----

\* CONSTANT definition @modelParameterDefinitions:0
CONSTANT def_ov_1555420481465123000
----
=============================================================================
\* Modification History
\* Created Tue Apr 16 21:14:41 CST 2019 by jywellin
