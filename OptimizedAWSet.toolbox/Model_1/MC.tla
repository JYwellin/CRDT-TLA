---- MODULE MC ----
EXTENDS OptimizedAWSet, TLC

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
r1, r2, r3
----

\* MV CONSTANT definitions Replica
const_155791846806892000 == 
{r1, r2, r3}
----

\* SYMMETRY definition
symm_155791846806893000 == 
Permutations(const_155791846806892000)
----

\* CONSTANT definitions @modelParameterConstants:0Data
const_155791846806894000 == 
{"a","b","c","d","e"}
----

\* CONSTANT definition @modelParameterDefinitions:0
CONSTANT def_ov_155791846806895000
----
\* SPECIFICATION definition @modelBehaviorSpec:0
spec_155791846806896000 ==
Spec
----
\* INVARIANT definition @modelCorrectnessInvariants:0
inv_155791846806897000 ==
TypeOK
----
\* INVARIANT definition @modelCorrectnessInvariants:1
inv_155791846806898000 ==
SEC
----
=============================================================================
\* Modification History
\* Created Wed May 15 19:07:48 CST 2019 by xhdn
