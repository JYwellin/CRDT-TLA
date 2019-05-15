---- MODULE MC ----
EXTENDS AWSet, TLC

\* CONSTANT definitions @modelParameterConstants:0Replica
const_155791423570236000 == 
{¡°r1¡±, ¡°r2¡±}
----

\* CONSTANT definitions @modelParameterConstants:1Data
const_155791423570237000 == 
{¡±a¡°}
----

\* CONSTANT definition @modelParameterDefinitions:0
CONSTANT def_ov_155791423570238000
----
\* CONSTRAINT definition @modelParameterContraint:0
constr_155791423570239000 ==
\A r \in Replica: seq[r] < 2
----
\* SPECIFICATION definition @modelBehaviorSpec:0
spec_155791423570240000 ==
Spec
----
\* INVARIANT definition @modelCorrectnessInvariants:0
inv_155791423570341000 ==
TypeOK
----
\* PROPERTY definition @modelCorrectnessProperties:0
prop_155791423570342000 ==
SEC
----
=============================================================================
\* Modification History
\* Created Wed May 15 17:57:15 CST 2019 by xhdn
