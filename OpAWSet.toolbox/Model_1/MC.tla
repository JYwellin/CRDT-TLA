---- MODULE MC ----
EXTENDS OpAWSet, TLC

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
r1, r2, r3
----

\* MV CONSTANT definitions Replica
const_155921570523923000 == 
{r1, r2, r3}
----

\* SYMMETRY definition
symm_155921570523924000 == 
Permutations(const_155921570523923000)
----

\* CONSTANT definitions @modelParameterConstants:0Data
const_155921570523925000 == 
{"a","b","c"}
----

\* CONSTANT definition @modelParameterDefinitions:0
CONSTANT def_ov_155921570523926000
----
\* SPECIFICATION definition @modelBehaviorSpec:0
spec_155921570523927000 ==
Spec
----
\* INVARIANT definition @modelCorrectnessInvariants:0
inv_155921570523928000 ==
TypeOK
----
\* INVARIANT definition @modelCorrectnessInvariants:1
inv_155921570523929000 ==
SEC
----
=============================================================================
\* Modification History
\* Created Thu May 30 19:28:25 CST 2019 by xhdn
