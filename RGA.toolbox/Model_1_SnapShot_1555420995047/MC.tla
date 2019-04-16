---- MODULE MC ----
EXTENDS RGA, TLC

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
r1, r2, r3
----

\* MV CONSTANT definitions Replica
const_1555420993028162000 == 
{r1, r2, r3}
----

\* SYMMETRY definition
symm_1555420993028163000 == 
Permutations(const_1555420993028162000)
----

\* CONSTANT definitions @modelParameterConstants:0Charnum
const_1555420993028164000 == 
5
----

\* CONSTANT definitions @modelParameterConstants:1Char
const_1555420993028165000 == 
{"a" ,"b" ,"c" ,"d" ,"e"}
----

\* CONSTANT definition @modelParameterDefinitions:0
CONSTANT def_ov_1555420993028166000
----
\* CONSTANT definition @modelParameterDefinitions:1
def_ov_1555420993028167000 ==
1..10
----
=============================================================================
\* Modification History
\* Created Tue Apr 16 21:23:13 CST 2019 by jywellin
