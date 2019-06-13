---- MODULE MC ----
EXTENDS StateAWSet, TLC

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
r1, r2, r3
----

\* MV CONSTANT definitions Replica
const_1560431705364106000 == 
{r1, r2, r3}
----

\* SYMMETRY definition
symm_1560431705364107000 == 
Permutations(const_1560431705364106000)
----

\* CONSTANT definitions @modelParameterConstants:0Data
const_1560431705364108000 == 
{"a","b","c"}
----

\* CONSTANT definition @modelParameterDefinitions:0
CONSTANT def_ov_1560431705364109000
----
\* SPECIFICATION definition @modelBehaviorSpec:0
spec_1560431705364110000 ==
Spec
----
\* INVARIANT definition @modelCorrectnessInvariants:0
inv_1560431705364111000 ==
SEC!SEC
----
\* INVARIANT definition @modelCorrectnessInvariants:1
inv_1560431705364112000 ==
TypeOK
----
=============================================================================
\* Modification History
\* Created Thu Jun 13 21:15:05 CST 2019 by xhdn
