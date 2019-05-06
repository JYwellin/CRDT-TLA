---- MODULE MC ----
EXTENDS RGA, TLC

\* CONSTANT definitions @modelParameterConstants:0Charnum
const_155716130062942000 == 
3
----

\* CONSTANT definitions @modelParameterConstants:1Char
const_155716130063043000 == 
{"a", "b" ,"c"}
----

\* CONSTANT definitions @modelParameterConstants:2Replica
const_155716130063044000 == 
{"r1", "r2", "r3"}
----

\* CONSTANT definition @modelParameterDefinitions:0
CONSTANT def_ov_155716130063045000
----
\* CONSTANT definition @modelParameterDefinitions:1
def_ov_155716130063046000 ==
0..100
----
\* Constant expression definition @modelExpressionEval
const_expr_155716130063047000 == 
 id["r1"] > id["r2"]
----

\* Constant expression ASSUME statement @modelExpressionEval
ASSUME PrintT(<<"$!@$!@$!@$!@$!",const_expr_155716130063047000>>)
----

\* SPECIFICATION definition @modelBehaviorSpec:0
spec_155716130063048000 ==
Spec
----
\* INVARIANT definition @modelCorrectnessInvariants:0
inv_155716130063049000 ==
TypeOK
----
\* INVARIANT definition @modelCorrectnessInvariants:1
inv_155716130063050000 ==
EC
----
\* INVARIANT definition @modelCorrectnessInvariants:2
inv_155716130063051000 ==
SEC
----
=============================================================================
\* Modification History
\* Created Tue May 07 00:48:20 CST 2019 by xhdn
