---- MODULE MC ----
EXTENDS OpCounter, TLC

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
r1, r2, r3
----

\* MV CONSTANT definitions Replica
const_155325935273720000 == 
{r1, r2, r3}
----

\* SYMMETRY definition
symm_155325935273721000 == 
Permutations(const_155325935273720000)
----

=============================================================================
\* Modification History
\* Created Fri Mar 22 20:55:52 CST 2019 by jywellin
