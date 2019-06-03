------------------------------ MODULE OpAWSet ------------------------------
EXTENDS Naturals, Sequences, Bags, TLC, CausalInterface
    
VARIABLES 
    set,            \* set[r]: set of active Instance(s) maintained by r \in Replica
    abuf,           \* buffer of elements added
    rbuf            \* buffer of elements removed
    
vars == <<set, abuf, rbuf, NETvars, SECvars>>
-----------------------------------------------------------------------------
TypeOK == 
    /\ set \in [Replica -> SUBSET Instance]
    /\ abuf \in [Replica -> SUBSET Instance]
    /\ rbuf \in [Replica -> SUBSET Instance]
    /\ IntTypeOK
-----------------------------------------------------------------------------
Init == 
    /\ set = [r \in Replica |-> {}] 
    /\ abuf = [r \in Replica |-> {}]
    /\ rbuf = [r \in Replica |-> {}]
    /\ IntInit 
-----------------------------------------------------------------------------                                    
Send(r) == 
    /\ \/ abuf[r] # {}
       \/ rbuf[r] # {}
    /\ IntSend(r, [r |-> r, seq |-> seq[r], update|-> OpUpdate(r), 
                   vc |-> [vc EXCEPT ![r][r] = @ + 1][r], abuf|-> abuf[r], rbuf|-> rbuf[r] ])
    /\ abuf' = [abuf EXCEPT ![r] = {}]
    /\ rbuf' = [rbuf EXCEPT ![r] = {}]
    /\ UNCHANGED <<set>>  
              
Receive(r) == 
    /\ IntReceive(r)
    /\ set' = [set EXCEPT ![r] = (@ \cup msg'.abuf) \ msg'.rbuf]
    /\ UNCHANGED <<abuf, rbuf>>         
-----------------------------------------------------------------------------
Add(d, r) == 
    /\ IntDo(r)
    /\ set' = [set EXCEPT ![r] = @ \union {[d |-> d, r |-> r, k |-> seq[r]]}] 
    /\ abuf'= [abuf EXCEPT ![r] = @ \union {[d |-> d, r |-> r, k |-> seq[r]]}] 
    /\ UNCHANGED <<rbuf>>     

Remove(d, r) ==
    /\ {ins \in set[r] : ins.d = d} # {}
    /\ IntDo(r)
    /\ LET D == {ins \in set[r] : ins.d = d}
       IN /\  set' = [set EXCEPT ![r] = @ \ D]  
          /\  rbuf' = [rbuf EXCEPT ![r] = @ \cup D]  
    /\ UNCHANGED <<abuf>>     
    
Update(r) ==  \E a \in Data: 
                 Add(a, r) \/ Remove(a, r)         
-----------------------------------------------------------------------------
Next == 
    \E r \in Replica: 
        Receive(r) \/ Send(r) \/ Update(r)

Spec == Init /\ [][Next]_vars
-----------------------------------------------------------------------------
Read(r) == {ins.d: ins \in set[r]}
 
SEC == \A r1, r2 \in Replica : 
        Sameupdate(r1, r2) => Read(r1) = Read(r2)
=============================================================================
\* Modification History
\* Last modified Tue Jun 04 01:10:22 CST 2019 by xhdn
\* Created Fri May 24 14:12:26 CST 2019 by xhdn
