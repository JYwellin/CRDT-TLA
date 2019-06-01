---- MODULE MC ----
EXTENDS OpCounter, TLC

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
r1, r2, r3
----

\* MV CONSTANT definitions Replica
const_1559392113130260000 == 
{r1, r2, r3}
----

\* SYMMETRY definition
symm_1559392113130261000 == 
Permutations(const_1559392113130260000)
----

\* CONSTANT definition @modelParameterDefinitions:0
CONSTANT def_ov_1559392113130262000
----
\* SPECIFICATION definition @modelBehaviorSpec:0
spec_1559392113130263000 ==
Spec
----
\* INVARIANT definition @modelCorrectnessInvariants:0
inv_1559392113130264000 ==
TypeOK
----
\* INVARIANT definition @modelCorrectnessInvariants:1
inv_1559392113130265000 ==
SEC
----
=============================================================================
\* Modification History
\* Created Sat Jun 01 20:28:33 CST 2019 by xhdn
