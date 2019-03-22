---- MODULE MC ----
EXTENDS OpCounter, TLC

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
r1, r2, r3
----

\* MV CONSTANT definitions Replica
const_155326102487872000 == 
{r1, r2, r3}
----

\* SYMMETRY definition
symm_155326102487873000 == 
Permutations(const_155326102487872000)
----

=============================================================================
\* Modification History
\* Created Fri Mar 22 21:23:44 CST 2019 by jywellin
