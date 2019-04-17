---- MODULE MC ----
EXTENDS RGA, TLC

\* CONSTANT definitions @modelParameterConstants:0Charnum
const_1555493694214220000 == 
1
----

\* CONSTANT definitions @modelParameterConstants:1Char
const_1555493694215221000 == 
{"a"}
----

\* CONSTANT definitions @modelParameterConstants:2Replica
const_1555493694215222000 == 
{"r1", "r2", "r3"}
----

\* CONSTANT definition @modelParameterDefinitions:0
CONSTANT def_ov_1555493694215223000
----
\* CONSTANT definition @modelParameterDefinitions:1
def_ov_1555493694215224000 ==
0..100
----
\* Constant expression definition @modelExpressionEval
const_expr_1555493694215225000 == 
 id["r1"] > id["r2"]
----

\* Constant expression ASSUME statement @modelExpressionEval
ASSUME PrintT(<<"$!@$!@$!@$!@$!",const_expr_1555493694215225000>>)
----

\* SPECIFICATION definition @modelBehaviorSpec:0
spec_1555493694215226000 ==
Spec
----
\* INVARIANT definition @modelCorrectnessInvariants:0
inv_1555493694215227000 ==
TypeOK
----
\* INVARIANT definition @modelCorrectnessInvariants:1
inv_1555493694215228000 ==
EC
----
\* INVARIANT definition @modelCorrectnessInvariants:2
inv_1555493694215229000 ==
SEC
----
=============================================================================
\* Modification History
\* Created Wed Apr 17 17:34:54 CST 2019 by xhdn
