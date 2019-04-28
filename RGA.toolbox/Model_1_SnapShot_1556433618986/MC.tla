---- MODULE MC ----
EXTENDS RGA, TLC

\* CONSTANT definitions @modelParameterConstants:0Charnum
const_155643360263738000 == 
3
----

\* CONSTANT definitions @modelParameterConstants:1Char
const_155643360263739000 == 
{"a", "b" ,"c"}
----

\* CONSTANT definitions @modelParameterConstants:2Replica
const_155643360263740000 == 
{"r1", "r2", "r3"}
----

\* CONSTANT definition @modelParameterDefinitions:0
CONSTANT def_ov_155643360263741000
----
\* CONSTANT definition @modelParameterDefinitions:1
def_ov_155643360263742000 ==
0..100
----
\* Constant expression definition @modelExpressionEval
const_expr_155643360263743000 == 
 id["r1"] > id["r2"]
----

\* Constant expression ASSUME statement @modelExpressionEval
ASSUME PrintT(<<"$!@$!@$!@$!@$!",const_expr_155643360263743000>>)
----

=============================================================================
\* Modification History
\* Created Sun Apr 28 14:40:02 CST 2019 by jywellin
