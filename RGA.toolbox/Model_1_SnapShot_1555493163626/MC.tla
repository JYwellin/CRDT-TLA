---- MODULE MC ----
EXTENDS RGA, TLC

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
r1, r2, r3
----

\* MV CONSTANT definitions Replica
const_1555493158385189000 == 
{r1, r2, r3}
----

\* SYMMETRY definition
symm_1555493158385190000 == 
Permutations(const_1555493158385189000)
----

\* CONSTANT definitions @modelParameterConstants:0Charnum
const_1555493158385191000 == 
1
----

\* CONSTANT definitions @modelParameterConstants:1Char
const_1555493158385192000 == 
{"a"}
----

\* CONSTANT definition @modelParameterDefinitions:0
CONSTANT def_ov_1555493158386193000
----
\* CONSTANT definition @modelParameterDefinitions:1
def_ov_1555493158386194000 ==
1..100
----
\* Constant expression definition @modelExpressionEval
const_expr_1555493158386195000 == 
 id["r1"] > id["r2"]
----

\* Constant expression ASSUME statement @modelExpressionEval
ASSUME PrintT(<<"$!@$!@$!@$!@$!",const_expr_1555493158386195000>>)
----

\* SPECIFICATION definition @modelBehaviorSpec:0
spec_1555493158386196000 ==
Spec
----
\* INVARIANT definition @modelCorrectnessInvariants:0
inv_1555493158386197000 ==
TypeOK
----
\* INVARIANT definition @modelCorrectnessInvariants:1
inv_1555493158386198000 ==
EC
----
\* INVARIANT definition @modelCorrectnessInvariants:2
inv_1555493158386199000 ==
SEC
----
=============================================================================
\* Modification History
\* Created Wed Apr 17 17:25:58 CST 2019 by xhdn
