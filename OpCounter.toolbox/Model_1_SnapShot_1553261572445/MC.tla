---- MODULE MC ----
EXTENDS OpCounter, TLC

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
r1, r2, r3
----

\* MV CONSTANT definitions Replica
const_155326156907586000 == 
{r1, r2, r3}
----

\* SYMMETRY definition
symm_155326156907587000 == 
Permutations(const_155326156907586000)
----

\* CONSTANT definition @modelParameterDefinitions:0
def_ov_155326156907588000 ==
0..5
----
=============================================================================
\* Modification History
\* Created Fri Mar 22 21:32:49 CST 2019 by jywellin
