---- MODULE MC ----
EXTENDS OpCounter, TLC

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
r1, r2, r3
----

\* MV CONSTANT definitions Replica
const_155326097745763000 == 
{r1, r2, r3}
----

\* SYMMETRY definition
symm_155326097745764000 == 
Permutations(const_155326097745763000)
----

\* CONSTANT definition @modelParameterDefinitions:0
def_ov_155326097745765000 ==
0..5
----
=============================================================================
\* Modification History
\* Created Fri Mar 22 21:22:57 CST 2019 by jywellin
