---- MODULE MC ----
EXTENDS OpCounter, TLC

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
r1, r2, r3
----

\* MV CONSTANT definitions Replica
const_15542069804612000 == 
{r1, r2, r3}
----

\* SYMMETRY definition
symm_15542069804613000 == 
Permutations(const_15542069804612000)
----

\* SPECIFICATION definition @modelBehaviorSpec:0
spec_15542069804614000 ==
Spec
----
\* INVARIANT definition @modelCorrectnessInvariants:0
inv_15542069804615000 ==
TypeOK
----
\* INVARIANT definition @modelCorrectnessInvariants:1
inv_15542069804616000 ==
EC
----
=============================================================================
\* Modification History
\* Created Tue Apr 02 20:09:40 CST 2019 by xhdn
