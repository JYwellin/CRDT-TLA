---- MODULE MC ----
EXTENDS RGA, TLC

\* CONSTANT definitions @modelParameterConstants:0Charnum
const_1555494342407260000 == 
1
----

\* CONSTANT definitions @modelParameterConstants:1Char
const_1555494342407261000 == 
{"a"}
----

\* CONSTANT definitions @modelParameterConstants:2Replica
const_1555494342407262000 == 
{"r1", "r2", "r3"}
----

\* CONSTANT definition @modelParameterDefinitions:0
CONSTANT def_ov_1555494342407263000
----
\* CONSTANT definition @modelParameterDefinitions:1
def_ov_1555494342407264000 ==
0..100
----
\* Constant expression definition @modelExpressionEval
const_expr_1555494342407265000 == 
 id["r1"] > id["r2"]
----

\* Constant expression ASSUME statement @modelExpressionEval
ASSUME PrintT(<<"$!@$!@$!@$!@$!",const_expr_1555494342407265000>>)
----

\* SPECIFICATION definition @modelBehaviorSpec:0
spec_1555494342407266000 ==
Spec
----
\* INVARIANT definition @modelCorrectnessInvariants:0
inv_1555494342407267000 ==
TypeOK
----
\* INVARIANT definition @modelCorrectnessInvariants:1
inv_1555494342407268000 ==
EC
----
\* INVARIANT definition @modelCorrectnessInvariants:2
inv_1555494342407269000 ==
SEC
----
=============================================================================
\* Modification History
\* Created Wed Apr 17 17:45:42 CST 2019 by xhdn
