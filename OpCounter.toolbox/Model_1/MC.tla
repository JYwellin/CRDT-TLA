---- MODULE MC ----
EXTENDS OpCounter, TLC

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
r1, r2, r3
----

\* MV CONSTANT definitions Replica
const_1559544643354351000 == 
{r1, r2, r3}
----

\* SYMMETRY definition
symm_1559544643354352000 == 
Permutations(const_1559544643354351000)
----

\* CONSTANT definition @modelParameterDefinitions:0
CONSTANT def_ov_1559544643354353000
----
\* SPECIFICATION definition @modelBehaviorSpec:0
spec_1559544643354354000 ==
Spec
----
\* INVARIANT definition @modelCorrectnessInvariants:0
inv_1559544643354355000 ==
TypeOK
----
\* INVARIANT definition @modelCorrectnessInvariants:1
inv_1559544643354356000 ==
SEC
----
=============================================================================
\* Modification History
\* Created Mon Jun 03 14:50:43 CST 2019 by xhdn
