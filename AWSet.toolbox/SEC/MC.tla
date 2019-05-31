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
const_155926207211613000 == 
{r1, r2}
----

\* MV CONSTANT definitions Data
const_155926207211614000 == 
{a}
----

\* SYMMETRY definition
symm_155926207211615000 == 
Permutations(const_155926207211613000) \union Permutations(const_155926207211614000)
----

\* CONSTANT definition @modelParameterDefinitions:0
CONSTANT def_ov_155926207211616000
----
\* CONSTRAINT definition @modelParameterContraint:0
constr_155926207211617000 ==
TLCSet("exit", TLCGet("distinct") > 10000)
----
=============================================================================
\* Modification History
\* Created Fri May 31 08:21:12 CST 2019 by zfwang
