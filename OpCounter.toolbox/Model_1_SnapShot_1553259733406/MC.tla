---- MODULE MC ----
EXTENDS OpCounter, TLC

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
r1, r2, r3
----

\* MV CONSTANT definitions Replica
const_155325973138658000 == 
{r1, r2, r3}
----

\* SYMMETRY definition
symm_155325973138659000 == 
Permutations(const_155325973138658000)
----

\* CONSTANT definition @modelParameterDefinitions:0
def_ov_155325973138660000 ==
0..5
----
=============================================================================
\* Modification History
\* Created Fri Mar 22 21:02:11 CST 2019 by jywellin
