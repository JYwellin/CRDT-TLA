---- MODULE MC ----
EXTENDS OpCounter, TLC

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
r1, r2, r3
----

\* MV CONSTANT definitions Replica
const_15542235702882000 == 
{r1, r2, r3}
----

\* SYMMETRY definition
symm_15542235702883000 == 
Permutations(const_15542235702882000)
----

\* CONSTANT definition @modelParameterDefinitions:0
CONSTANT def_ov_15542235702884000
----
\* SPECIFICATION definition @modelBehaviorSpec:0
spec_15542235702885000 ==
Spec
----
\* INVARIANT definition @modelCorrectnessInvariants:0
inv_15542235702886000 ==
TypeOK
----
\* INVARIANT definition @modelCorrectnessInvariants:1
inv_15542235702887000 ==
EC
----
=============================================================================
\* Modification History
\* Created Wed Apr 03 00:46:10 CST 2019 by xhdn
