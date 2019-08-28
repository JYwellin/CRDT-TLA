---- MODULE MC ----
EXTENDS OpAWSet, TLC

\* CONSTANT definitions @modelParameterConstants:0Data
const_156700437658042000 == 
{"a","b","c"}
----

\* CONSTANT definitions @modelParameterConstants:2Replica
const_156700437658043000 == 
{"r1","r2","r3"}
----

\* CONSTANT definitions @modelParameterConstants:3Read(r)
const_156700437658044000(r) == 
ReadOpAWSet(r)
----

\* CONSTANT definition @modelParameterDefinitions:0
def_ov_156700437658045000 ==
0..100
----
\* CONSTRAINT definition @modelParameterContraint:0
constr_156700437658046000 ==
\A r \in Replica: Cardinality(doset[r])<=1
----
\* SPECIFICATION definition @modelBehaviorSpec:0
spec_156700437658047000 ==
Spec
----
\* PROPERTY definition @modelCorrectnessProperties:0
prop_156700437658048000 ==
Correctness!EV
----
=============================================================================
\* Modification History
\* Created Wed Aug 28 22:59:36 CST 2019 by xhdn
