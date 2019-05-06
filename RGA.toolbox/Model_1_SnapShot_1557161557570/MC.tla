---- MODULE MC ----
EXTENDS RGA, TLC

\* CONSTANT definitions @modelParameterConstants:0Charnum
const_155716134495752000 == 
3
----

\* CONSTANT definitions @modelParameterConstants:1Char
const_155716134495753000 == 
{"a", "b" ,"c"}
----

\* CONSTANT definitions @modelParameterConstants:2Replica
const_155716134495754000 == 
{"r1", "r2", "r3"}
----

\* CONSTANT definition @modelParameterDefinitions:0
CONSTANT def_ov_155716134495755000
----
\* CONSTANT definition @modelParameterDefinitions:1
def_ov_155716134495756000 ==
0..100
----
\* Constant expression definition @modelExpressionEval
const_expr_155716134495757000 == 
 id["r1"] > id["r2"]
----

\* Constant expression ASSUME statement @modelExpressionEval
ASSUME PrintT(<<"$!@$!@$!@$!@$!",const_expr_155716134495757000>>)
----

\* SPECIFICATION definition @modelBehaviorSpec:0
spec_155716134495758000 ==
Spec
----
\* INVARIANT definition @modelCorrectnessInvariants:0
inv_155716134495759000 ==
TypeOK
----
\* INVARIANT definition @modelCorrectnessInvariants:1
inv_155716134495760000 ==
EC
----
\* INVARIANT definition @modelCorrectnessInvariants:2
inv_155716134495761000 ==
SEC
----
=============================================================================
\* Modification History
\* Created Tue May 07 00:49:04 CST 2019 by xhdn
