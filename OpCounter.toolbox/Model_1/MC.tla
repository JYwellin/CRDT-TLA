---- MODULE MC ----
EXTENDS OpCounter, TLC

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
r1, r2, r3
----

\* MV CONSTANT definitions Replica
const_155326161730099000 == 
{r1, r2, r3}
----

\* SYMMETRY definition
symm_1553261617300100000 == 
Permutations(const_155326161730099000)
----

=============================================================================
\* Modification History
\* Created Fri Mar 22 21:33:37 CST 2019 by jywellin
