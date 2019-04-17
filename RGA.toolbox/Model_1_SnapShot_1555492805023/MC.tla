---- MODULE MC ----
EXTENDS RGA, TLC

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
r1, r2, r3
----

\* MV CONSTANT definitions Replica
const_1555492798859145000 == 
{r1, r2, r3}
----

\* SYMMETRY definition
symm_1555492798859146000 == 
Permutations(const_1555492798859145000)
----

\* CONSTANT definitions @modelParameterConstants:0Charnum
const_1555492798859147000 == 
1
----

\* CONSTANT definitions @modelParameterConstants:1Char
const_1555492798859148000 == 
{"a"}
----

\* CONSTANT definition @modelParameterDefinitions:0
CONSTANT def_ov_1555492798859149000
----
\* CONSTANT definition @modelParameterDefinitions:1
def_ov_1555492798859150000 ==
1..100
----
\* Constant expression definition @modelExpressionEval
const_expr_1555492798859151000 == 
1 < 2
----

\* Constant expression ASSUME statement @modelExpressionEval
ASSUME PrintT(<<"$!@$!@$!@$!@$!",const_expr_1555492798859151000>>)
----

\* SPECIFICATION definition @modelBehaviorSpec:0
spec_1555492798859152000 ==
Spec
----
\* INVARIANT definition @modelCorrectnessInvariants:0
inv_1555492798859153000 ==
TypeOK
----
\* INVARIANT definition @modelCorrectnessInvariants:1
inv_1555492798859154000 ==
EC
----
\* INVARIANT definition @modelCorrectnessInvariants:2
inv_1555492798859155000 ==
SEC
----
=============================================================================
\* Modification History
\* Created Wed Apr 17 17:19:58 CST 2019 by xhdn
