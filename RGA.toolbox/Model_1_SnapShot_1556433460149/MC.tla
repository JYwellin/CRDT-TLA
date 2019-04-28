---- MODULE MC ----
EXTENDS RGA, TLC

\* CONSTANT definitions @modelParameterConstants:0Charnum
const_155643338498620000 == 
3
----

\* CONSTANT definitions @modelParameterConstants:1Char
const_155643338498621000 == 
{"a", "b" ,"c"}
----

\* CONSTANT definitions @modelParameterConstants:2Replica
const_155643338498622000 == 
{"r1", "r2", "r3"}
----

\* CONSTANT definition @modelParameterDefinitions:0
CONSTANT def_ov_155643338498623000
----
\* CONSTANT definition @modelParameterDefinitions:1
def_ov_155643338498624000 ==
0..100
----
\* Constant expression definition @modelExpressionEval
const_expr_155643338498625000 == 
 id["r1"] > id["r2"]
----

\* Constant expression ASSUME statement @modelExpressionEval
ASSUME PrintT(<<"$!@$!@$!@$!@$!",const_expr_155643338498625000>>)
----

=============================================================================
\* Modification History
\* Created Sun Apr 28 14:36:24 CST 2019 by jywellin
