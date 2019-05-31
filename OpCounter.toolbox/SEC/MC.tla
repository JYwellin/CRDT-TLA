---- MODULE MC ----
EXTENDS OpCounter, TLC

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
r1, r2
----

\* MV CONSTANT definitions Replica
const_15580578070222000 == 
{r1, r2}
----

\* SYMMETRY definition
symm_15580578070233000 == 
Permutations(const_15580578070222000)
----

\* CONSTANT definition @modelParameterDefinitions:0
CONSTANT def_ov_15580578070234000
----
=============================================================================
\* Modification History
\* Created Fri May 17 09:50:07 CST 2019 by zfwang
