---- MODULE MC ----
EXTENDS RGA, TLC

\* CONSTANT definitions @modelParameterConstants:0Charnum
const_155643357281429000 == 
3
----

\* CONSTANT definitions @modelParameterConstants:1Char
const_155643357281430000 == 
{"a", "b" ,"c"}
----

\* CONSTANT definitions @modelParameterConstants:2Replica
const_155643357281431000 == 
{"r1", "r2", "r3"}
----

\* CONSTANT definition @modelParameterDefinitions:0
CONSTANT def_ov_155643357281532000
----
\* CONSTANT definition @modelParameterDefinitions:1
def_ov_155643357281533000 ==
0..100
----
\* Constant expression definition @modelExpressionEval
const_expr_155643357281534000 == 
 id["r1"] > id["r2"]
----

\* Constant expression ASSUME statement @modelExpressionEval
ASSUME PrintT(<<"$!@$!@$!@$!@$!",const_expr_155643357281534000>>)
----

=============================================================================
\* Modification History
\* Created Sun Apr 28 14:39:32 CST 2019 by jywellin
