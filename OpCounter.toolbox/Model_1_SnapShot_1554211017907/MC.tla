---- MODULE MC ----
EXTENDS OpCounter, TLC

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
r1, r2, r3
----

\* MV CONSTANT definitions Replica
const_155421101480217000 == 
{r1, r2, r3}
----

\* SYMMETRY definition
symm_155421101480218000 == 
Permutations(const_155421101480217000)
----

\* SPECIFICATION definition @modelBehaviorSpec:0
spec_155421101480219000 ==
Spec
----
\* INVARIANT definition @modelCorrectnessInvariants:0
inv_155421101480220000 ==
TypeOK
----
\* INVARIANT definition @modelCorrectnessInvariants:1
inv_155421101480221000 ==
EC
----
=============================================================================
\* Modification History
\* Created Tue Apr 02 21:16:54 CST 2019 by xhdn
