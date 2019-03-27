---- MODULE MC ----
EXTENDS OpCounter, TLC

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
r1, r2, r3
----

\* MV CONSTANT definitions Replica
const_15536773150976000 == 
{r1, r2, r3}
----

\* SYMMETRY definition
symm_15536773150977000 == 
Permutations(const_15536773150976000)
----

=============================================================================
\* Modification History
\* Created Wed Mar 27 17:01:55 CST 2019 by jywellin
