---- MODULE MC ----
EXTENDS StateCounter, TLC

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
r1, r2, r3
----

\* MV CONSTANT definitions Replica
const_155419281558438000 == 
{r1, r2, r3}
----

\* SYMMETRY definition
symm_155419281558439000 == 
Permutations(const_155419281558438000)
----

=============================================================================
\* Modification History
\* Created Tue Apr 02 16:13:35 CST 2019 by jywellin
