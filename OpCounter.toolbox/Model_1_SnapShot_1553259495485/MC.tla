---- MODULE MC ----
EXTENDS OpCounter, TLC

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
r1, r2, r3
----

\* MV CONSTANT definitions Replica
const_155325949346334000 == 
{r1, r2, r3}
----

\* SYMMETRY definition
symm_155325949346335000 == 
Permutations(const_155325949346334000)
----

=============================================================================
\* Modification History
\* Created Fri Mar 22 20:58:13 CST 2019 by jywellin
