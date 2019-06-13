---- MODULE MC ----
EXTENDS OpAWSet, TLC

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
r1, r2, r3
----

\* MV CONSTANT definitions Replica
const_1560432062392113000 == 
{r1, r2, r3}
----

\* SYMMETRY definition
symm_1560432062392114000 == 
Permutations(const_1560432062392113000)
----

\* CONSTANT definitions @modelParameterConstants:0Data
const_1560432062392115000 == 
{"a","b","c"}
----

\* CONSTANT definition @modelParameterDefinitions:0
CONSTANT def_ov_1560432062392116000
----
\* SPECIFICATION definition @modelBehaviorSpec:0
spec_1560432062392117000 ==
Spec
----
\* INVARIANT definition @modelCorrectnessInvariants:0
inv_1560432062392118000 ==
TypeOK
----
\* INVARIANT definition @modelCorrectnessInvariants:1
inv_1560432062392119000 ==
SEC!SEC
----
=============================================================================
\* Modification History
\* Created Thu Jun 13 21:21:02 CST 2019 by xhdn
