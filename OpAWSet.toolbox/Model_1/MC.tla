---- MODULE MC ----
EXTENDS OpAWSet, TLC

\* CONSTANT definitions @modelParameterConstants:0Data
const_1567009284690112000 == 
{"a"}
----

\* CONSTANT definitions @modelParameterConstants:2Replica
const_1567009284690113000 == 
{"r1","r2"}
----

\* CONSTANT definitions @modelParameterConstants:3Read(r)
const_1567009284690114000(r) == 
ReadOpAWSet(r)
----

\* CONSTANT definition @modelParameterDefinitions:0
def_ov_1567009284690115000 ==
0..100
----
\* CONSTRAINT definition @modelParameterContraint:0
constr_1567009284691116000 ==
\A r \in Replica: Cardinality(doset[r])<=3
----
\* SPECIFICATION definition @modelBehaviorSpec:0
spec_1567009284691117000 ==
Spec
----
\* PROPERTY definition @modelCorrectnessProperties:0
prop_1567009284691118000 ==
Correctness!EV
----
=============================================================================
\* Modification History
\* Created Thu Aug 29 00:21:24 CST 2019 by xhdn
