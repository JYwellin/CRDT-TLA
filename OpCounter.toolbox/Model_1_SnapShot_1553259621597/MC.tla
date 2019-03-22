---- MODULE MC ----
EXTENDS OpCounter, TLC

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
r1, r2, r3
----

\* MV CONSTANT definitions Replica
const_155325961957548000 == 
{r1, r2, r3}
----

\* SYMMETRY definition
symm_155325961957549000 == 
Permutations(const_155325961957548000)
----

\* CONSTANT definition @modelParameterDefinitions:0
def_ov_155325961957650000 ==
1..5
----
=============================================================================
\* Modification History
\* Created Fri Mar 22 21:00:19 CST 2019 by jywellin
