---- MODULE MC ----
EXTENDS RGA, TLC

\* CONSTANT definitions @modelParameterConstants:0Charnum
const_155716092417032000 == 
3
----

\* CONSTANT definitions @modelParameterConstants:1Char
const_155716092417033000 == 
{"a", "b" ,"c"}
----

\* CONSTANT definitions @modelParameterConstants:2Replica
const_155716092417034000 == 
{"r1", "r2", "r3"}
----

\* CONSTANT definition @modelParameterDefinitions:0
CONSTANT def_ov_155716092417035000
----
\* CONSTANT definition @modelParameterDefinitions:1
def_ov_155716092417036000 ==
0..100
----
\* Constant expression definition @modelExpressionEval
const_expr_155716092417037000 == 
 id["r1"] > id["r2"]
----

\* Constant expression ASSUME statement @modelExpressionEval
ASSUME PrintT(<<"$!@$!@$!@$!@$!",const_expr_155716092417037000>>)
----

\* SPECIFICATION definition @modelBehaviorSpec:0
spec_155716092417038000 ==
Spec
----
\* INVARIANT definition @modelCorrectnessInvariants:0
inv_155716092417039000 ==
TypeOK
----
\* INVARIANT definition @modelCorrectnessInvariants:1
inv_155716092417040000 ==
EC
----
\* INVARIANT definition @modelCorrectnessInvariants:2
inv_155716092417041000 ==
SEC
----
=============================================================================
\* Modification History
\* Created Tue May 07 00:42:04 CST 2019 by xhdn
