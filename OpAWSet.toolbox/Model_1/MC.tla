---- MODULE MC ----
EXTENDS OpAWSet, TLC

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
r1, r2, r3
----

\* MV CONSTANT definitions Replica
const_1561526283667114000 == 
{r1, r2, r3}
----

\* SYMMETRY definition
symm_1561526283667115000 == 
Permutations(const_1561526283667114000)
----

\* CONSTANT definitions @modelParameterConstants:0Data
const_1561526283667116000 == 
{"a","b","c"}
----

\* CONSTANT definitions @modelParameterConstants:2Read(r)
const_1561526283667117000(r) == 
ReadOpAWSet(r)
----

\* CONSTANT definition @modelParameterDefinitions:0
CONSTANT def_ov_1561526283667118000
----
\* SPECIFICATION definition @modelBehaviorSpec:0
spec_1561526283667119000 ==
Spec
----
\* INVARIANT definition @modelCorrectnessInvariants:0
inv_1561526283667120000 ==
TypeOK
----
\* INVARIANT definition @modelCorrectnessInvariants:1
inv_1561526283667121000 ==
SEC!SEC
----
=============================================================================
\* Modification History
\* Created Wed Jun 26 13:18:03 CST 2019 by xhdn
