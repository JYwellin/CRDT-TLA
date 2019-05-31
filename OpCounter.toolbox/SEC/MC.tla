---- MODULE MC ----
EXTENDS OpCounter, TLC

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
r1, r2
----

\* MV CONSTANT definitions Replica
const_155926215746439000 == 
{r1, r2}
----

\* SYMMETRY definition
symm_155926215746440000 == 
Permutations(const_155926215746439000)
----

\* CONSTANT definition @modelParameterDefinitions:0
CONSTANT def_ov_155926215746441000
----
\* CONSTRAINT definition @modelParameterContraint:0
constr_155926215746442000 ==
TLCSet("exit", TLCGet("distinct") > 10000)
----
=============================================================================
\* Modification History
\* Created Fri May 31 08:22:37 CST 2019 by zfwang
