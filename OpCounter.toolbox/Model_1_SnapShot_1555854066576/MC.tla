---- MODULE MC ----
EXTENDS OpCounter, TLC

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
r1, r2, r3
----

\* MV CONSTANT definitions Replica
const_15558540612029000 == 
{r1, r2, r3}
----

\* SYMMETRY definition
symm_155585406120210000 == 
Permutations(const_15558540612029000)
----

\* CONSTANT definition @modelParameterDefinitions:0
CONSTANT def_ov_155585406120211000
----
\* SPECIFICATION definition @modelBehaviorSpec:0
spec_155585406120212000 ==
Spec
----
\* INVARIANT definition @modelCorrectnessInvariants:0
inv_155585406120213000 ==
TypeOK
----
\* INVARIANT definition @modelCorrectnessInvariants:1
inv_155585406120214000 ==
EC
----
\* INVARIANT definition @modelCorrectnessInvariants:2
inv_155585406120215000 ==
SEC
----
=============================================================================
\* Modification History
\* Created Sun Apr 21 21:41:01 CST 2019 by xhdn
