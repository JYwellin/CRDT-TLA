---- MODULE MC ----
EXTENDS StateCounter, TLC

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
r1, r2, r3
----

\* MV CONSTANT definitions Replica
const_15547231035377000 == 
{r1, r2, r3}
----

\* SYMMETRY definition
symm_15547231035378000 == 
Permutations(const_15547231035377000)
----

=============================================================================
\* Modification History
\* Created Mon Apr 08 19:31:43 CST 2019 by jywellin
