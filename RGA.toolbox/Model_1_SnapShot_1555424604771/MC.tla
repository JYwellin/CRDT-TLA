---- MODULE MC ----
EXTENDS RGA, TLC

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
r1, r2, r3
----

\* MV CONSTANT definitions Replica
const_1555424602753240000 == 
{r1, r2, r3}
----

\* SYMMETRY definition
symm_1555424602753241000 == 
Permutations(const_1555424602753240000)
----

\* CONSTANT definitions @modelParameterConstants:0Charnum
const_1555424602753242000 == 
10
----

\* CONSTANT definitions @modelParameterConstants:1Char
const_1555424602753243000 == 
{"a" ,"b" ,"c" ,"d" ,"e","1","2","3","4","5"}
----

\* CONSTANT definition @modelParameterDefinitions:0
CONSTANT def_ov_1555424602753244000
----
\* CONSTANT definition @modelParameterDefinitions:1
def_ov_1555424602753245000 ==
1..10
----
=============================================================================
\* Modification History
\* Created Tue Apr 16 22:23:22 CST 2019 by jywellin
