---- MODULE MC ----
EXTENDS RGA, TLC

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
r1, r2, r3
----

\* MV CONSTANT definitions Replica
const_1555493134708167000 == 
{r1, r2, r3}
----

\* SYMMETRY definition
symm_1555493134708168000 == 
Permutations(const_1555493134708167000)
----

\* CONSTANT definitions @modelParameterConstants:0Charnum
const_1555493134708169000 == 
1
----

\* CONSTANT definitions @modelParameterConstants:1Char
const_1555493134708170000 == 
{"a"}
----

\* CONSTANT definition @modelParameterDefinitions:0
CONSTANT def_ov_1555493134708171000
----
\* CONSTANT definition @modelParameterDefinitions:1
def_ov_1555493134708172000 ==
1..100
----
\* Constant expression definition @modelExpressionEval
const_expr_1555493134708173000 == 
 id[r1] > id[r2]
----

\* Constant expression ASSUME statement @modelExpressionEval
ASSUME PrintT(<<"$!@$!@$!@$!@$!",const_expr_1555493134708173000>>)
----

\* SPECIFICATION definition @modelBehaviorSpec:0
spec_1555493134708174000 ==
Spec
----
\* INVARIANT definition @modelCorrectnessInvariants:0
inv_1555493134708175000 ==
TypeOK
----
\* INVARIANT definition @modelCorrectnessInvariants:1
inv_1555493134708176000 ==
EC
----
\* INVARIANT definition @modelCorrectnessInvariants:2
inv_1555493134708177000 ==
SEC
----
=============================================================================
\* Modification History
\* Created Wed Apr 17 17:25:34 CST 2019 by xhdn
