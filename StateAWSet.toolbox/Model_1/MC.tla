---- MODULE MC ----
EXTENDS StateAWSet, TLC

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
r1, r2, r3
----

\* MV CONSTANT definitions Replica
const_156152594651576000 == 
{r1, r2, r3}
----

\* SYMMETRY definition
symm_156152594651577000 == 
Permutations(const_156152594651576000)
----

\* CONSTANT definitions @modelParameterConstants:0Data
const_156152594651578000 == 
{"a","b","c"}
----

\* CONSTANT definitions @modelParameterConstants:2Read(r)
const_156152594651579000(r) == 
ReadStateAWSet(r)
----

\* CONSTANT definition @modelParameterDefinitions:0
CONSTANT def_ov_156152594651580000
----
\* SPECIFICATION definition @modelBehaviorSpec:0
spec_156152594651581000 ==
Spec
----
\* INVARIANT definition @modelCorrectnessInvariants:0
inv_156152594651582000 ==
SEC!SEC
----
\* INVARIANT definition @modelCorrectnessInvariants:1
inv_156152594651583000 ==
TypeOK
----
=============================================================================
\* Modification History
\* Created Wed Jun 26 13:12:26 CST 2019 by xhdn
