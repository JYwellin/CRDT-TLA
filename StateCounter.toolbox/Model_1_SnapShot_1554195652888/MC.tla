---- MODULE MC ----
EXTENDS StateCounter, TLC

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
r1, r2, r3
----

\* MV CONSTANT definitions Replica
const_155419564584666000 == 
{r1, r2, r3}
----

\* SYMMETRY definition
symm_155419564584767000 == 
Permutations(const_155419564584666000)
----

=============================================================================
\* Modification History
\* Created Tue Apr 02 17:00:45 CST 2019 by jywellin
