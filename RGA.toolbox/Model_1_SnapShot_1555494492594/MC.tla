---- MODULE MC ----
EXTENDS RGA, TLC

\* CONSTANT definitions @modelParameterConstants:0Charnum
const_1555494485480300000 == 
1
----

\* CONSTANT definitions @modelParameterConstants:1Char
const_1555494485480301000 == 
{"a"}
----

\* CONSTANT definitions @modelParameterConstants:2Replica
const_1555494485480302000 == 
{"r1", "r2"}
----

\* CONSTANT definition @modelParameterDefinitions:0
CONSTANT def_ov_1555494485480303000
----
\* CONSTANT definition @modelParameterDefinitions:1
def_ov_1555494485480304000 ==
0..100
----
\* Constant expression definition @modelExpressionEval
const_expr_1555494485480305000 == 
 id["r1"] > id["r2"]
----

\* Constant expression ASSUME statement @modelExpressionEval
ASSUME PrintT(<<"$!@$!@$!@$!@$!",const_expr_1555494485480305000>>)
----

\* SPECIFICATION definition @modelBehaviorSpec:0
spec_1555494485480306000 ==
Spec
----
\* INVARIANT definition @modelCorrectnessInvariants:0
inv_1555494485480307000 ==
TypeOK
----
\* INVARIANT definition @modelCorrectnessInvariants:1
inv_1555494485480308000 ==
EC
----
\* INVARIANT definition @modelCorrectnessInvariants:2
inv_1555494485480309000 ==
SEC
----
=============================================================================
\* Modification History
\* Created Wed Apr 17 17:48:05 CST 2019 by xhdn