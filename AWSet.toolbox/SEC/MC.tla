---- MODULE MC ----
EXTENDS AWSet, TLC

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
r1, r2
----

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
a
----

\* MV CONSTANT definitions Replica
const_1557725459606248000 == 
{r1, r2}
----

\* MV CONSTANT definitions Data
const_1557725459606249000 == 
{a}
----

\* SYMMETRY definition
symm_1557725459606250000 == 
Permutations(const_1557725459606248000) \union Permutations(const_1557725459606249000)
----

\* CONSTANT definition @modelParameterDefinitions:0
CONSTANT def_ov_1557725459606251000
----
\* CONSTRAINT definition @modelParameterContraint:0
constr_1557725459606252000 ==
\A r \in Replica: seq[r] < 2
----
=============================================================================
\* Modification History
\* Created Mon May 13 13:30:59 CST 2019 by zfwang
