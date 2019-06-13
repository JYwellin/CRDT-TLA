---- MODULE MC ----
EXTENDS OpCounter, TLC

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
r1, r2, r3
----

\* MV CONSTANT definitions Replica
const_15596328394802000 == 
{r1, r2, r3}
----

\* SYMMETRY definition
symm_15596328394813000 == 
Permutations(const_15596328394802000)
----

\* CONSTANT definition @modelParameterDefinitions:0
CONSTANT def_ov_15596328394814000
----
\* SPECIFICATION definition @modelBehaviorSpec:0
spec_15596328394815000 ==
Spec
----
\* INVARIANT definition @modelCorrectnessInvariants:0
inv_15596328394816000 ==
TypeOK
----
\* INVARIANT definition @modelCorrectnessInvariants:1
inv_15596328394817000 ==
SEC
----
=============================================================================
\* Modification History
\* Created Tue Jun 04 15:20:39 CST 2019 by xhdn
