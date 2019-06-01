---- MODULE MC ----
EXTENDS StateCounter, TLC

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
r1, r2, r3
----

\* MV CONSTANT definitions Replica
const_1559394321350324000 == 
{r1, r2, r3}
----

\* SYMMETRY definition
symm_1559394321350325000 == 
Permutations(const_1559394321350324000)
----

\* CONSTANT definition @modelParameterDefinitions:0
CONSTANT def_ov_1559394321350326000
----
\* SPECIFICATION definition @modelBehaviorSpec:0
spec_1559394321350327000 ==
Spec
----
\* INVARIANT definition @modelCorrectnessInvariants:0
inv_1559394321350328000 ==
TypeOK
----
\* INVARIANT definition @modelCorrectnessInvariants:1
inv_1559394321350329000 ==
SEC
----
=============================================================================
\* Modification History
\* Created Sat Jun 01 21:05:21 CST 2019 by xhdn
