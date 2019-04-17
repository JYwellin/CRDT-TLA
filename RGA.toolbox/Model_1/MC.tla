---- MODULE MC ----
EXTENDS RGA, TLC

\* CONSTANT definitions @modelParameterConstants:0Charnum
const_1555498322430330000 == 
3
----

\* CONSTANT definitions @modelParameterConstants:1Char
const_1555498322430331000 == 
{"a", "b" ,"c"}
----

\* CONSTANT definitions @modelParameterConstants:2Replica
const_1555498322430332000 == 
{"r1", "r2", "r3"}
----

\* CONSTANT definition @modelParameterDefinitions:0
CONSTANT def_ov_1555498322430333000
----
\* CONSTANT definition @modelParameterDefinitions:1
def_ov_1555498322430334000 ==
0..100
----
\* Constant expression definition @modelExpressionEval
const_expr_1555498322430335000 == 
 id["r1"] > id["r2"]
----

\* Constant expression ASSUME statement @modelExpressionEval
ASSUME PrintT(<<"$!@$!@$!@$!@$!",const_expr_1555498322430335000>>)
----

\* SPECIFICATION definition @modelBehaviorSpec:0
spec_1555498322430336000 ==
Spec
----
\* INVARIANT definition @modelCorrectnessInvariants:0
inv_1555498322430337000 ==
TypeOK
----
\* INVARIANT definition @modelCorrectnessInvariants:1
inv_1555498322430338000 ==
EC
----
\* INVARIANT definition @modelCorrectnessInvariants:2
inv_1555498322430339000 ==
SEC
----
=============================================================================
\* Modification History
\* Created Wed Apr 17 18:52:02 CST 2019 by xhdn
