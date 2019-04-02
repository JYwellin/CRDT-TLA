---- MODULE MC ----
EXTENDS OpCounter, TLC

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
r1, r2, r3
----

\* MV CONSTANT definitions Replica
const_15541896162832000 == 
{r1, r2, r3}
----

\* SYMMETRY definition
symm_15541896162833000 == 
Permutations(const_15541896162832000)
----

=============================================================================
\* Modification History
\* Created Tue Apr 02 15:20:16 CST 2019 by jywellin
