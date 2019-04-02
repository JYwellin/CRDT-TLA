---- MODULE MC ----
EXTENDS OpCounter, TLC

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
r1, r2, r3
----

\* MV CONSTANT definitions Replica
const_155419437519342000 == 
{r1, r2, r3}
----

\* SYMMETRY definition
symm_155419437519343000 == 
Permutations(const_155419437519342000)
----

=============================================================================
\* Modification History
\* Created Tue Apr 02 16:39:35 CST 2019 by jywellin
