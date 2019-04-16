---- MODULE MC ----
EXTENDS RGA, TLC

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
r1, r2, r3
----

\* MV CONSTANT definitions Replica
const_155541992654498000 == 
{r1, r2, r3}
----

\* SYMMETRY definition
symm_155541992654499000 == 
Permutations(const_155541992654498000)
----

\* CONSTANT definitions @modelParameterConstants:0Charnum
const_1555419926544100000 == 
5
----

\* CONSTANT definitions @modelParameterConstants:1Char
const_1555419926544101000 == 
{"a" ,"b" ,"c" ,"d" ,"e"}
----

\* CONSTANT definition @modelParameterDefinitions:0
CONSTANT def_ov_1555419926544102000
----
\* CONSTANT definition @modelParameterDefinitions:1
def_ov_1555419926544103000 ==
1..10
----
=============================================================================
\* Modification History
\* Created Tue Apr 16 21:05:26 CST 2019 by jywellin
