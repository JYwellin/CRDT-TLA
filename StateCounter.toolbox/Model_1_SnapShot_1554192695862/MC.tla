---- MODULE MC ----
EXTENDS StateCounter, TLC

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
r1, r2, r3
----

\* MV CONSTANT definitions Replica
const_155419269190134000 == 
{r1, r2, r3}
----

\* SYMMETRY definition
symm_155419269190135000 == 
Permutations(const_155419269190134000)
----

=============================================================================
\* Modification History
\* Created Tue Apr 02 16:11:31 CST 2019 by jywellin
