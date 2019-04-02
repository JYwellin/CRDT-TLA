---- MODULE MC ----
EXTENDS OpCounter, TLC

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
r1, r2, r3
----

\* MV CONSTANT definitions Replica
const_155421081184012000 == 
{r1, r2, r3}
----

\* SYMMETRY definition
symm_155421081184013000 == 
Permutations(const_155421081184012000)
----

\* SPECIFICATION definition @modelBehaviorSpec:0
spec_155421081184014000 ==
Spec
----
\* INVARIANT definition @modelCorrectnessInvariants:0
inv_155421081184015000 ==
TypeOK
----
\* INVARIANT definition @modelCorrectnessInvariants:1
inv_155421081184016000 ==
EC
----
=============================================================================
\* Modification History
\* Created Tue Apr 02 21:13:31 CST 2019 by xhdn
