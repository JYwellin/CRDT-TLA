---- MODULE MC ----
EXTENDS ORSet, TLC

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
r1, r2
----

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
a
----

\* MV CONSTANT definitions Replica
const_15592616516772000 == 
{r1, r2}
----

\* MV CONSTANT definitions Data
const_15592616516773000 == 
{a}
----

\* SYMMETRY definition
symm_15592616516774000 == 
Permutations(const_15592616516772000) \union Permutations(const_15592616516773000)
----

\* CONSTANT definition @modelParameterDefinitions:0
CONSTANT def_ov_15592616516775000
----
\* CONSTRAINT definition @modelParameterContraint:0
constr_15592616516776000 ==
TLCSet("exit", TLCGet("distinct") > 10000)
----
=============================================================================
\* Modification History
\* Created Fri May 31 08:14:11 CST 2019 by zfwang
