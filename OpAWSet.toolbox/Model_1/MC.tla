---- MODULE MC ----
EXTENDS OpAWSet, TLC

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
r1, r2, r3
----

\* MV CONSTANT definitions Replica
const_1559393210798299000 == 
{r1, r2, r3}
----

\* SYMMETRY definition
symm_1559393210798300000 == 
Permutations(const_1559393210798299000)
----

\* CONSTANT definitions @modelParameterConstants:0Data
const_1559393210798301000 == 
{"a","b","c"}
----

\* CONSTANT definition @modelParameterDefinitions:0
CONSTANT def_ov_1559393210798302000
----
\* SPECIFICATION definition @modelBehaviorSpec:0
spec_1559393210798303000 ==
Spec
----
\* INVARIANT definition @modelCorrectnessInvariants:0
inv_1559393210798304000 ==
TypeOK
----
\* INVARIANT definition @modelCorrectnessInvariants:1
inv_1559393210798305000 ==
SEC
----
=============================================================================
\* Modification History
\* Created Sat Jun 01 20:46:50 CST 2019 by xhdn
