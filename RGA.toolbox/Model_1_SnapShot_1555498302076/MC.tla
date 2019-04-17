---- MODULE MC ----
EXTENDS RGA, TLC

\* CONSTANT definitions @modelParameterConstants:0Charnum
const_1555498258452320000 == 
3
----

\* CONSTANT definitions @modelParameterConstants:1Char
const_1555498258452321000 == 
{"a", "b" ,"c"}
----

\* CONSTANT definitions @modelParameterConstants:2Replica
const_1555498258452322000 == 
{"r1", "r2", "r3"}
----

\* CONSTANT definition @modelParameterDefinitions:0
CONSTANT def_ov_1555498258452323000
----
\* CONSTANT definition @modelParameterDefinitions:1
def_ov_1555498258452324000 ==
0..100
----
\* Constant expression definition @modelExpressionEval
const_expr_1555498258452325000 == 
 id["r1"] > id["r2"]
----

\* Constant expression ASSUME statement @modelExpressionEval
ASSUME PrintT(<<"$!@$!@$!@$!@$!",const_expr_1555498258452325000>>)
----

\* SPECIFICATION definition @modelBehaviorSpec:0
spec_1555498258452326000 ==
Spec
----
\* INVARIANT definition @modelCorrectnessInvariants:0
inv_1555498258452327000 ==
TypeOK
----
\* INVARIANT definition @modelCorrectnessInvariants:1
inv_1555498258452328000 ==
EC
----
\* INVARIANT definition @modelCorrectnessInvariants:2
inv_1555498258452329000 ==
SEC
----
=============================================================================
\* Modification History
\* Created Wed Apr 17 18:50:58 CST 2019 by xhdn
