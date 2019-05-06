---- MODULE MC ----
EXTENDS RGA, TLC

\* CONSTANT definitions @modelParameterConstants:0Charnum
const_155716081884922000 == 
3
----

\* CONSTANT definitions @modelParameterConstants:1Char
const_155716081884923000 == 
{"a", "b" ,"c"}
----

\* CONSTANT definitions @modelParameterConstants:2Replica
const_155716081884924000 == 
{"r1", "r2", "r3"}
----

\* CONSTANT definition @modelParameterDefinitions:0
CONSTANT def_ov_155716081884925000
----
\* CONSTANT definition @modelParameterDefinitions:1
def_ov_155716081884926000 ==
0..100
----
\* Constant expression definition @modelExpressionEval
const_expr_155716081884927000 == 
 id["r1"] > id["r2"]
----

\* Constant expression ASSUME statement @modelExpressionEval
ASSUME PrintT(<<"$!@$!@$!@$!@$!",const_expr_155716081884927000>>)
----

\* SPECIFICATION definition @modelBehaviorSpec:0
spec_155716081884928000 ==
Spec
----
\* INVARIANT definition @modelCorrectnessInvariants:0
inv_155716081885029000 ==
TypeOK
----
\* INVARIANT definition @modelCorrectnessInvariants:1
inv_155716081885030000 ==
EC
----
\* INVARIANT definition @modelCorrectnessInvariants:2
inv_155716081885031000 ==
SEC
----
=============================================================================
\* Modification History
\* Created Tue May 07 00:40:18 CST 2019 by xhdn
