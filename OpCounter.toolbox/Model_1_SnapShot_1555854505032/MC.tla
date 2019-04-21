---- MODULE MC ----
EXTENDS OpCounter, TLC

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
r1, r2, r3
----

\* MV CONSTANT definitions Replica
const_155585448884130000 == 
{r1, r2, r3}
----

\* SYMMETRY definition
symm_155585448884131000 == 
Permutations(const_155585448884130000)
----

\* CONSTANT definition @modelParameterDefinitions:0
CONSTANT def_ov_155585448884132000
----
\* SPECIFICATION definition @modelBehaviorSpec:0
spec_155585448884133000 ==
Spec
----
\* INVARIANT definition @modelCorrectnessInvariants:0
inv_155585448884134000 ==
TypeOK
----
\* INVARIANT definition @modelCorrectnessInvariants:1
inv_155585448884135000 ==
EC
----
\* INVARIANT definition @modelCorrectnessInvariants:2
inv_155585448884136000 ==
SEC
----
=============================================================================
\* Modification History
\* Created Sun Apr 21 21:48:08 CST 2019 by xhdn
