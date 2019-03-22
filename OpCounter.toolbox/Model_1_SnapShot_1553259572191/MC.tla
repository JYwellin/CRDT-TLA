---- MODULE MC ----
EXTENDS OpCounter, TLC

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
r1, r2, r3
----

\* MV CONSTANT definitions Replica
const_155325957016943000 == 
{r1, r2, r3}
----

\* SYMMETRY definition
symm_155325957016944000 == 
Permutations(const_155325957016943000)
----

\* CONSTANT definition @modelParameterDefinitions:0
def_ov_155325957016945000 ==
1..5
----
=============================================================================
\* Modification History
\* Created Fri Mar 22 20:59:30 CST 2019 by jywellin
