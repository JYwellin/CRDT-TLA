---- MODULE MC ----
EXTENDS OpCounter, TLC

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
r1, r2, r3
----

\* MV CONSTANT definitions Replica
const_155326158532895000 == 
{r1, r2, r3}
----

\* SYMMETRY definition
symm_155326158532896000 == 
Permutations(const_155326158532895000)
----

=============================================================================
\* Modification History
\* Created Fri Mar 22 21:33:05 CST 2019 by jywellin
