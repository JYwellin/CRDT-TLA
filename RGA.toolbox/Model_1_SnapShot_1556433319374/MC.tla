---- MODULE MC ----
EXTENDS RGA, TLC

\* CONSTANT definitions @modelParameterConstants:0Charnum
const_155643331634111000 == 
3
----

\* CONSTANT definitions @modelParameterConstants:1Char
const_155643331634112000 == 
{"a", "b" ,"c"}
----

\* CONSTANT definitions @modelParameterConstants:2Replica
const_155643331634113000 == 
{"r1", "r2", "r3"}
----

\* CONSTANT definition @modelParameterDefinitions:0
CONSTANT def_ov_155643331634114000
----
\* CONSTANT definition @modelParameterDefinitions:1
def_ov_155643331634115000 ==
0..100
----
\* Constant expression definition @modelExpressionEval
const_expr_155643331634116000 == 
 id["r1"] > id["r2"]
----

\* Constant expression ASSUME statement @modelExpressionEval
ASSUME PrintT(<<"$!@$!@$!@$!@$!",const_expr_155643331634116000>>)
----

=============================================================================
\* Modification History
\* Created Sun Apr 28 14:35:16 CST 2019 by jywellin
