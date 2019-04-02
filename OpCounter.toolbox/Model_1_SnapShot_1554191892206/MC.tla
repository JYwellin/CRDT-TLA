---- MODULE MC ----
EXTENDS OpCounter, TLC

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
r1, r2, r3
----

\* MV CONSTANT definitions Replica
const_155419187013722000 == 
{r1, r2, r3}
----

\* SYMMETRY definition
symm_155419187013723000 == 
Permutations(const_155419187013722000)
----

=============================================================================
\* Modification History
\* Created Tue Apr 02 15:57:50 CST 2019 by jywellin
