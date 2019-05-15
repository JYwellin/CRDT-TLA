------------------------------- MODULE ORSet -------------------------------
EXTENDS Naturals, Sequences, Bags, TLC, SEC

CONSTANTS 
    Data      \* the set of data
    
Instance == [d: Data, r: Replica, k: Nat]
  
VARIABLES 
    sSet,     \* sSet[r]: set of active Instance(s) maintained by r \in Replica
    seq,      \* seq[r]: local sequence number at replica r \in Replic
    (* Network variables *)    
    incoming, \* incoming[r]: incoming messages at replica r \in Replica   
    msg,
    messageSet 

vars == <<sSet, seq, incoming, msg, messageSet, SECvars>>

Msg == [r : Replica, update : SUBSET Update, seq : Nat, S: SUBSET Instance]
-----------------------------------------------------------------------------
Network == INSTANCE ReliableNetwork
-----------------------------------------------------------------------------
TypeOK == 
    /\ sSet \in [Replica -> SUBSET Instance]
    /\ seq \in [Replica -> Nat]
-----------------------------------------------------------------------------
Init == 
    /\ sSet = [r \in Replica |-> {}]
    /\ seq = [r \in Replica |-> 0]  
    /\ incoming = [r \in Replica |-> <<>>]  
    /\ Network!RInit
    /\ SECInit
-----------------------------------------------------------------------------
Add(d, r) == 
    /\ sSet'= [sSet EXCEPT ![r] = @ \union {[d |-> d, r |-> r, k |-> seq'[r]]}] 
    /\ seq' = [seq EXCEPT ![r] = @ + 1]
    /\ SECUpdate(r, seq[r])
    /\ UNCHANGED <<incoming, msg, messageSet>>

Remove(d, r) ==
    /\ LET D == {ins \in sSet[r] : ins.d = d}
       IN  sSet' = [sSet EXCEPT ![r] = @ \ D] 
    /\ seq' = [seq EXCEPT ![r] = @ + 1]
    /\ SECUpdate(r, seq[r])         
    /\ UNCHANGED <<incoming, msg, messageSet>> 
-----------------------------------------------------------------------------
Broadcast(s, m) == 
    [r \in Replica |-> IF s = r THEN incoming[s] 
                                ELSE incoming[r] (+) SetToBag({m})]
                                    
Send(r) == 
    /\ Network!RBroadcast(r, [r |-> r, seq |-> seq[r], update|-> OpUpdate(r), S |-> sSet[r]])
    /\ SECSend(r) 
    /\ UNCHANGED <<sSet, seq>>
              
Receive(r) == 
    /\ sSet' = [sSet EXCEPT ![r] = @ \cup msg'[r].S]
    /\ Network!RDeliver(r)
    /\ SECDeliver(r, msg'[r])
    /\ UNCHANGED <<seq>>                
-----------------------------------------------------------------------------
Next ==
    \/ \E r \in Replica: \E a \in Data: 
        Add(a, r) \/ Remove(a, r)
    \/ \E r \in Replica: 
        Send(r) \/ Receive(r)

Spec == Init /\ [][Next]_vars
-----------------------------------------------------------------------------
Read(r) == {ins.d: ins \in sSet[r]}

(* QC: Quiescent Consistency *)
Quiescence == \A r \in Replica: incoming[r] = <<>>
    
Convergence == \A r, s \in Replica: Read(r) = Read(s)

QC == Quiescence => Convergence

(* SEC: Strong Eventual Consistency *)   
SEC == \A r1, r2 \in Replica : SameUpdate(r1, r2) => Read(r1) = Read(r2)
=============================================================================
\* Modification History
\* Last modified Wed May 15 20:55:13 CST 2019 by zfwang
\* Created Wed Feb 27 17:23:32 CST 2019 by zfwang
