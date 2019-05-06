---- MODULE MC ----
EXTENDS RGA, TLC

\* CONSTANT definitions @modelParameterConstants:0Charnum
const_1557132656353267000 == 
3
----

\* CONSTANT definitions @modelParameterConstants:1Char
const_1557132656353268000 == 
{"a", "b" ,"c"}
----

\* CONSTANT definitions @modelParameterConstants:2Replica
const_1557132656353269000 == 
{"r1", "r2", "r3"}
----

\* CONSTANT definition @modelParameterDefinitions:0
CONSTANT def_ov_1557132656353270000
----
\* CONSTANT definition @modelParameterDefinitions:1
def_ov_1557132656353271000 ==
0..100
----
\* Constant expression definition @modelExpressionEval
const_expr_1557132656353272000 == 
 id["r1"] > id["r2"]
----

\* Constant expression ASSUME statement @modelExpressionEval
ASSUME PrintT(<<"$!@$!@$!@$!@$!",const_expr_1557132656353272000>>)
----

=============================================================================
\* Modification History
\* Created Mon May 06 16:50:56 CST 2019 by jywellin
