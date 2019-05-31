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
const_1557969549026361000 == 
{r1, r2}
----

\* MV CONSTANT definitions Data
const_1557969549026362000 == 
{a}
----

\* SYMMETRY definition
symm_1557969549026363000 == 
Permutations(const_1557969549026361000) \union Permutations(const_1557969549026362000)
----

\* CONSTANT definition @modelParameterDefinitions:0
CONSTANT def_ov_1557969549026364000
----
=============================================================================
\* Modification History
\* Created Thu May 16 09:19:09 CST 2019 by zfwang
