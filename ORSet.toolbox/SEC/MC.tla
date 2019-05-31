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
const_155926210166618000 == 
{r1, r2}
----

\* MV CONSTANT definitions Data
const_155926210166619000 == 
{a}
----

\* SYMMETRY definition
symm_155926210166620000 == 
Permutations(const_155926210166618000) \union Permutations(const_155926210166619000)
----

\* CONSTANT definition @modelParameterDefinitions:0
CONSTANT def_ov_155926210166621000
----
\* CONSTRAINT definition @modelParameterContraint:0
constr_155926210166622000 ==
TLCSet("exit", TLCGet("distinct") > 10000)
----
=============================================================================
\* Modification History
\* Created Fri May 31 08:21:41 CST 2019 by zfwang
