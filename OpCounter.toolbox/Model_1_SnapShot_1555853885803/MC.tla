---- MODULE MC ----
EXTENDS OpCounter, TLC

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
r1, r2, r3
----

\* MV CONSTANT definitions Replica
const_15558538624832000 == 
{r1, r2, r3}
----

\* SYMMETRY definition
symm_15558538624833000 == 
Permutations(const_15558538624832000)
----

\* CONSTANT definition @modelParameterDefinitions:0
CONSTANT def_ov_15558538624834000
----
\* SPECIFICATION definition @modelBehaviorSpec:0
spec_15558538624835000 ==
Spec
----
\* INVARIANT definition @modelCorrectnessInvariants:0
inv_15558538624836000 ==
TypeOK
----
\* INVARIANT definition @modelCorrectnessInvariants:1
inv_15558538624837000 ==
EC
----
\* INVARIANT definition @modelCorrectnessInvariants:2
inv_15558538624838000 ==
SEC
----
=============================================================================
\* Modification History
\* Created Sun Apr 21 21:37:42 CST 2019 by xhdn
