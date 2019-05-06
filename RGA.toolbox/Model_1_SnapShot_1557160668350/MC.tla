---- MODULE MC ----
EXTENDS RGA, TLC

\* CONSTANT definitions @modelParameterConstants:0Charnum
const_155716064590512000 == 
3
----

\* CONSTANT definitions @modelParameterConstants:1Char
const_155716064590513000 == 
{"a", "b" ,"c"}
----

\* CONSTANT definitions @modelParameterConstants:2Replica
const_155716064590514000 == 
{"r1", "r2", "r3"}
----

\* CONSTANT definition @modelParameterDefinitions:0
CONSTANT def_ov_155716064590515000
----
\* CONSTANT definition @modelParameterDefinitions:1
def_ov_155716064590516000 ==
0..100
----
\* Constant expression definition @modelExpressionEval
const_expr_155716064590517000 == 
 id["r1"] > id["r2"]
----

\* Constant expression ASSUME statement @modelExpressionEval
ASSUME PrintT(<<"$!@$!@$!@$!@$!",const_expr_155716064590517000>>)
----

\* SPECIFICATION definition @modelBehaviorSpec:0
spec_155716064590518000 ==
Spec
----
\* INVARIANT definition @modelCorrectnessInvariants:0
inv_155716064590519000 ==
TypeOK
----
\* INVARIANT definition @modelCorrectnessInvariants:1
inv_155716064590520000 ==
EC
----
\* INVARIANT definition @modelCorrectnessInvariants:2
inv_155716064590521000 ==
SEC
----
=============================================================================
\* Modification History
\* Created Tue May 07 00:37:25 CST 2019 by xhdn
