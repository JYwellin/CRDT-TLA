---- MODULE MC ----
EXTENDS StateCounter, TLC

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
r1, r2, r3
----

\* MV CONSTANT definitions Replica
const_155419140991814000 == 
{r1, r2, r3}
----

\* SYMMETRY definition
symm_155419140991815000 == 
Permutations(const_155419140991814000)
----

=============================================================================
\* Modification History
\* Created Tue Apr 02 15:50:09 CST 2019 by jywellin
