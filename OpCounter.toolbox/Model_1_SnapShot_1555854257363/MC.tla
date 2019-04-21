---- MODULE MC ----
EXTENDS OpCounter, TLC

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
r1, r2, r3
----

\* MV CONSTANT definitions Replica
const_155585424593723000 == 
{r1, r2, r3}
----

\* SYMMETRY definition
symm_155585424593724000 == 
Permutations(const_155585424593723000)
----

\* CONSTANT definition @modelParameterDefinitions:0
CONSTANT def_ov_155585424593725000
----
\* SPECIFICATION definition @modelBehaviorSpec:0
spec_155585424593726000 ==
Spec
----
\* INVARIANT definition @modelCorrectnessInvariants:0
inv_155585424593727000 ==
TypeOK
----
\* INVARIANT definition @modelCorrectnessInvariants:1
inv_155585424593728000 ==
EC
----
\* INVARIANT definition @modelCorrectnessInvariants:2
inv_155585424593729000 ==
SEC
----
=============================================================================
\* Modification History
\* Created Sun Apr 21 21:44:05 CST 2019 by xhdn
