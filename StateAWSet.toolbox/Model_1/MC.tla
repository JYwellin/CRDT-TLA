---- MODULE MC ----
EXTENDS StateAWSet, TLC

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
r1, r2, r3
----

\* MV CONSTANT definitions Replica
const_1559307657660111000 == 
{r1, r2, r3}
----

\* SYMMETRY definition
symm_1559307657660112000 == 
Permutations(const_1559307657660111000)
----

\* CONSTANT definitions @modelParameterConstants:0Data
const_1559307657660113000 == 
{"a","b","c"}
----

\* CONSTANT definition @modelParameterDefinitions:0
CONSTANT def_ov_1559307657660114000
----
\* SPECIFICATION definition @modelBehaviorSpec:0
spec_1559307657660115000 ==
Spec
----
\* INVARIANT definition @modelCorrectnessInvariants:0
inv_1559307657660116000 ==
SEC
----
=============================================================================
\* Modification History
\* Created Fri May 31 21:00:57 CST 2019 by xhdn
