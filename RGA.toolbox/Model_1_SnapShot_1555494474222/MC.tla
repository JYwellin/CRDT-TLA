---- MODULE MC ----
EXTENDS RGA, TLC

\* CONSTANT definitions @modelParameterConstants:0Charnum
const_1555494467153280000 == 
1
----

\* CONSTANT definitions @modelParameterConstants:1Char
const_1555494467153281000 == 
{"a"}
----

\* CONSTANT definitions @modelParameterConstants:2Replica
const_1555494467153282000 == 
{"r1", "r2"}
----

\* CONSTANT definition @modelParameterDefinitions:0
CONSTANT def_ov_1555494467153283000
----
\* CONSTANT definition @modelParameterDefinitions:1
def_ov_1555494467153284000 ==
0..100
----
\* Constant expression definition @modelExpressionEval
const_expr_1555494467153285000 == 
 id["r1"] > id["r2"]
----

\* Constant expression ASSUME statement @modelExpressionEval
ASSUME PrintT(<<"$!@$!@$!@$!@$!",const_expr_1555494467153285000>>)
----

\* SPECIFICATION definition @modelBehaviorSpec:0
spec_1555494467153286000 ==
Spec
----
\* INVARIANT definition @modelCorrectnessInvariants:0
inv_1555494467153287000 ==
TypeOK
----
\* INVARIANT definition @modelCorrectnessInvariants:1
inv_1555494467153288000 ==
EC
----
\* INVARIANT definition @modelCorrectnessInvariants:2
inv_1555494467153289000 ==
SEC
----
=============================================================================
\* Modification History
\* Created Wed Apr 17 17:47:47 CST 2019 by xhdn
