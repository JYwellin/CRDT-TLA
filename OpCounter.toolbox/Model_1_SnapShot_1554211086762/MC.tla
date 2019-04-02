---- MODULE MC ----
EXTENDS OpCounter, TLC

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
r1, r2, r3
----

\* MV CONSTANT definitions Replica
const_155421108366522000 == 
{r1, r2, r3}
----

\* SYMMETRY definition
symm_155421108366523000 == 
Permutations(const_155421108366522000)
----

\* SPECIFICATION definition @modelBehaviorSpec:0
spec_155421108366524000 ==
Spec
----
\* INVARIANT definition @modelCorrectnessInvariants:0
inv_155421108366525000 ==
TypeOK
----
\* INVARIANT definition @modelCorrectnessInvariants:1
inv_155421108366526000 ==
EC
----
=============================================================================
\* Modification History
\* Created Tue Apr 02 21:18:03 CST 2019 by xhdn
