---- MODULE MC ----
EXTENDS RGA, TLC

\* CONSTANT definitions @modelParameterConstants:0Charnum
const_15564331349292000 == 
3
----

\* CONSTANT definitions @modelParameterConstants:1Char
const_15564331349293000 == 
{"a", "b" ,"c"}
----

\* CONSTANT definitions @modelParameterConstants:2Replica
const_15564331349294000 == 
{"r1", "r2", "r3"}
----

\* CONSTANT definition @modelParameterDefinitions:0
CONSTANT def_ov_15564331349305000
----
\* CONSTANT definition @modelParameterDefinitions:1
def_ov_15564331349306000 ==
0..100
----
\* Constant expression definition @modelExpressionEval
const_expr_15564331349307000 == 
 id["r1"] > id["r2"]
----

\* Constant expression ASSUME statement @modelExpressionEval
ASSUME PrintT(<<"$!@$!@$!@$!@$!",const_expr_15564331349307000>>)
----

=============================================================================
\* Modification History
\* Created Sun Apr 28 14:32:14 CST 2019 by jywellin
