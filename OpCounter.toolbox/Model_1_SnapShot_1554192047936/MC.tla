---- MODULE MC ----
EXTENDS OpCounter, TLC

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
r1, r2, r3
----

\* MV CONSTANT definitions Replica
const_155419204089126000 == 
{r1, r2, r3}
----

\* SYMMETRY definition
symm_155419204089227000 == 
Permutations(const_155419204089126000)
----

=============================================================================
\* Modification History
\* Created Tue Apr 02 16:00:40 CST 2019 by jywellin
