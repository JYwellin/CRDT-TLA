---- MODULE MC ----
EXTENDS RGA, TLC

\* CONSTANT definitions @modelParameterConstants:0Charnum
const_1555494253314230000 == 
1
----

\* CONSTANT definitions @modelParameterConstants:1Char
const_1555494253314231000 == 
{"a"}
----

\* CONSTANT definitions @modelParameterConstants:2Replica
const_1555494253314232000 == 
{"r1", "r2", "r3"}
----

\* CONSTANT definition @modelParameterDefinitions:0
CONSTANT def_ov_1555494253314233000
----
\* CONSTANT definition @modelParameterDefinitions:1
def_ov_1555494253314234000 ==
0..100
----
\* Constant expression definition @modelExpressionEval
const_expr_1555494253314235000 == 
 id["r1"] > id["r2"]
----

\* Constant expression ASSUME statement @modelExpressionEval
ASSUME PrintT(<<"$!@$!@$!@$!@$!",const_expr_1555494253314235000>>)
----

\* SPECIFICATION definition @modelBehaviorSpec:0
spec_1555494253314236000 ==
Spec
----
\* INVARIANT definition @modelCorrectnessInvariants:0
inv_1555494253314237000 ==
TypeOK
----
\* INVARIANT definition @modelCorrectnessInvariants:1
inv_1555494253314238000 ==
EC
----
\* INVARIANT definition @modelCorrectnessInvariants:2
inv_1555494253314239000 ==
SEC
----
=============================================================================
\* Modification History
\* Created Wed Apr 17 17:44:13 CST 2019 by xhdn
