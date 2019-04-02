---- MODULE MC ----
EXTENDS OpCounter, TLC

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
r1, r2, r3
----

\* MV CONSTANT definitions Replica
const_155421135875227000 == 
{r1, r2, r3}
----

\* SYMMETRY definition
symm_155421135875228000 == 
Permutations(const_155421135875227000)
----

\* SPECIFICATION definition @modelBehaviorSpec:0
spec_155421135875229000 ==
Spec
----
\* INVARIANT definition @modelCorrectnessInvariants:0
inv_155421135875230000 ==
TypeOK
----
\* INVARIANT definition @modelCorrectnessInvariants:1
inv_155421135875231000 ==
EC
----
=============================================================================
\* Modification History
\* Created Tue Apr 02 21:22:38 CST 2019 by xhdn
