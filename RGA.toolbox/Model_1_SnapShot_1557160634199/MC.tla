---- MODULE MC ----
EXTENDS RGA, TLC

\* CONSTANT definitions @modelParameterConstants:0Charnum
const_15571606088622000 == 
3
----

\* CONSTANT definitions @modelParameterConstants:1Char
const_15571606088623000 == 
{"a", "b" ,"c"}
----

\* CONSTANT definitions @modelParameterConstants:2Replica
const_15571606088624000 == 
{"r1", "r2", "r3"}
----

\* CONSTANT definition @modelParameterDefinitions:0
CONSTANT def_ov_15571606088625000
----
\* CONSTANT definition @modelParameterDefinitions:1
def_ov_15571606088626000 ==
0..100
----
\* Constant expression definition @modelExpressionEval
const_expr_15571606088627000 == 
 id["r1"] > id["r2"]
----

\* Constant expression ASSUME statement @modelExpressionEval
ASSUME PrintT(<<"$!@$!@$!@$!@$!",const_expr_15571606088627000>>)
----

\* SPECIFICATION definition @modelBehaviorSpec:0
spec_15571606088638000 ==
Spec
----
\* INVARIANT definition @modelCorrectnessInvariants:0
inv_15571606088639000 ==
TypeOK
----
\* INVARIANT definition @modelCorrectnessInvariants:1
inv_155716060886310000 ==
EC
----
\* INVARIANT definition @modelCorrectnessInvariants:2
inv_155716060886311000 ==
SEC
----
=============================================================================
\* Modification History
\* Created Tue May 07 00:36:48 CST 2019 by xhdn
