---- MODULE MC ----
EXTENDS OpCounter, TLC

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
r1, r2, r3
----

\* MV CONSTANT definitions Replica
const_15541985309892000 == 
{r1, r2, r3}
----

\* SYMMETRY definition
symm_15541985309893000 == 
Permutations(const_15541985309892000)
----

\* SPECIFICATION definition @modelBehaviorSpec:0
spec_15541985309894000 ==
Spec
----
\* INVARIANT definition @modelCorrectnessInvariants:0
inv_15541985309895000 ==
TypeOK
----
\* INVARIANT definition @modelCorrectnessInvariants:1
inv_15541985309896000 ==
EC
----
=============================================================================
\* Modification History
\* Created Tue Apr 02 17:48:50 CST 2019 by xhdn
