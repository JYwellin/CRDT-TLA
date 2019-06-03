---- MODULE MC ----
EXTENDS OpAWSet, TLC

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
r1, r2, r3
----

\* MV CONSTANT definitions Replica
const_1559580423249464000 == 
{r1, r2, r3}
----

\* SYMMETRY definition
symm_1559580423249465000 == 
Permutations(const_1559580423249464000)
----

\* CONSTANT definitions @modelParameterConstants:0Data
const_1559580423249466000 == 
{"a","b","c"}
----

\* CONSTANT definition @modelParameterDefinitions:0
CONSTANT def_ov_1559580423249467000
----
\* SPECIFICATION definition @modelBehaviorSpec:0
spec_1559580423249468000 ==
Spec
----
\* INVARIANT definition @modelCorrectnessInvariants:0
inv_1559580423249469000 ==
TypeOK
----
\* INVARIANT definition @modelCorrectnessInvariants:1
inv_1559580423249470000 ==
SEC
----
=============================================================================
\* Modification History
\* Created Tue Jun 04 00:47:03 CST 2019 by xhdn
