---- MODULE MC ----
EXTENDS OpCounter, TLC

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
r1, r2, r3
----

\* MV CONSTANT definitions Replica
const_155419595280970000 == 
{r1, r2, r3}
----

\* SYMMETRY definition
symm_155419595280971000 == 
Permutations(const_155419595280970000)
----

=============================================================================
\* Modification History
\* Created Tue Apr 02 17:05:52 CST 2019 by jywellin
