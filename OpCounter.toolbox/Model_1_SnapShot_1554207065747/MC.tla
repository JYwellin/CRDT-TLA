---- MODULE MC ----
EXTENDS OpCounter, TLC

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
r1, r2, r3
----

\* MV CONSTANT definitions Replica
const_15542070553357000 == 
{r1, r2, r3}
----

\* SYMMETRY definition
symm_15542070553358000 == 
Permutations(const_15542070553357000)
----

\* SPECIFICATION definition @modelBehaviorSpec:0
spec_15542070553359000 ==
Spec
----
\* INVARIANT definition @modelCorrectnessInvariants:0
inv_155420705533510000 ==
TypeOK
----
\* INVARIANT definition @modelCorrectnessInvariants:1
inv_155420705533511000 ==
EC
----
=============================================================================
\* Modification History
\* Created Tue Apr 02 20:10:55 CST 2019 by xhdn
