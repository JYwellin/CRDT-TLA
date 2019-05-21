---- MODULE MC ----
EXTENDS OpCounter, TLC

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
r1, r2, r3
----

\* MV CONSTANT definitions Replica
const_15579268762802000 == 
{r1, r2, r3}
----

\* SYMMETRY definition
symm_15579268762803000 == 
Permutations(const_15579268762802000)
----

\* CONSTANT definition @modelParameterDefinitions:0
CONSTANT def_ov_15579268762804000
----
\* SPECIFICATION definition @modelBehaviorSpec:0
spec_15579268762805000 ==
Spec
----
\* INVARIANT definition @modelCorrectnessInvariants:0
inv_15579268762816000 ==
TypeOK
----
\* INVARIANT definition @modelCorrectnessInvariants:1
inv_15579268762817000 ==
EC
----
\* INVARIANT definition @modelCorrectnessInvariants:2
inv_15579268762818000 ==
SEC
----
=============================================================================
\* Modification History
\* Created Wed May 15 21:27:56 CST 2019 by xhdn
