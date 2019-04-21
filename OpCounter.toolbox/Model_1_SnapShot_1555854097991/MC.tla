---- MODULE MC ----
EXTENDS OpCounter, TLC

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
r1, r2, r3
----

\* MV CONSTANT definitions Replica
const_155585409290216000 == 
{r1, r2, r3}
----

\* SYMMETRY definition
symm_155585409290217000 == 
Permutations(const_155585409290216000)
----

\* CONSTANT definition @modelParameterDefinitions:0
CONSTANT def_ov_155585409290218000
----
\* SPECIFICATION definition @modelBehaviorSpec:0
spec_155585409290219000 ==
Spec
----
\* INVARIANT definition @modelCorrectnessInvariants:0
inv_155585409290220000 ==
TypeOK
----
\* INVARIANT definition @modelCorrectnessInvariants:1
inv_155585409290221000 ==
EC
----
\* INVARIANT definition @modelCorrectnessInvariants:2
inv_155585409290222000 ==
SEC
----
=============================================================================
\* Modification History
\* Created Sun Apr 21 21:41:32 CST 2019 by xhdn
