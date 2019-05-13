---- MODULE MC ----
EXTENDS ORSet, TLC

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
r1, r2, r3
----

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
a, b
----

\* MV CONSTANT definitions Replica
const_1557646031892173000 == 
{r1, r2, r3}
----

\* MV CONSTANT definitions Data
const_1557646031892174000 == 
{a, b}
----

\* SYMMETRY definition
symm_1557646031892175000 == 
Permutations(const_1557646031892173000) \union Permutations(const_1557646031892174000)
----

\* CONSTANT definition @modelParameterDefinitions:0
CONSTANT def_ov_1557646031892176000
----
\* ACTION_CONSTRAINT definition @modelParameterActionConstraint:0
action_constr_1557646031892177000 ==
\A r \in Replica: seq[r] <= 3
----
=============================================================================
\* Modification History
\* Created Sun May 12 15:27:11 CST 2019 by zfwang
