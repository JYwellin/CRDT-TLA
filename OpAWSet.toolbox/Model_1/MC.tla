---- MODULE MC ----
EXTENDS OpAWSet, TLC

\* CONSTANT definitions @modelParameterConstants:0Data
const_156699522926528000 == 
{"a","b","c"}
----

\* CONSTANT definitions @modelParameterConstants:2Replica
const_156699522926529000 == 
{"r1","r2","r3"}
----

\* CONSTANT definitions @modelParameterConstants:3Read(r)
const_156699522926530000(r) == 
ReadOpAWSet(r)
----

\* CONSTANT definition @modelParameterDefinitions:0
def_ov_156699522926531000 ==
0..100
----
\* CONSTRAINT definition @modelParameterContraint:0
constr_156699522926532000 ==
\A r \in Replica: Cardinality(doset[r])<=1
----
\* SPECIFICATION definition @modelBehaviorSpec:0
spec_156699522926533000 ==
Spec
----
\* PROPERTY definition @modelCorrectnessProperties:0
prop_156699522926534000 ==
Correctness!ED
----
=============================================================================
\* Modification History
\* Created Wed Aug 28 20:27:09 CST 2019 by xhdn
