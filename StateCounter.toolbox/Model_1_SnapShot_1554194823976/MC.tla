---- MODULE MC ----
EXTENDS StateCounter, TLC

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
r1, r2, r3
----

\* MV CONSTANT definitions Replica
const_155419482095446000 == 
{r1, r2, r3}
----

\* SYMMETRY definition
symm_155419482095447000 == 
Permutations(const_155419482095446000)
----

=============================================================================
\* Modification History
\* Created Tue Apr 02 16:47:00 CST 2019 by jywellin
