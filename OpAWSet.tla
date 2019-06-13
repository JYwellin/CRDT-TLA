------------------------------ MODULE OpAWSet ------------------------------
EXTENDS AWSet
-----------------------------------------------------------------------------
VARIABLES 
    set,       \* set[r]: set of Element(s) maintained by r \in Replica
    abuf,      \* abuf[r]: buffer of Element(s) added maintained by r \in Replica
    rbuf,      \* rbuf[r]: buffer of Element(s) removed maintained by r \in Replica
    
    (*
    network variables
    *) 
    incoming,
    dmsg,            
    lmsg, 
    vc,
    (*
    SEC variables
    *) 
    updateset,
    uincoming,
    new_updateset

Nvars == <<incoming, lmsg, dmsg, vc>>
SECvars == <<updateset, new_updateset, uincoming>> 
vars == <<set, abuf, rbuf, seq, Nvars, SECvars>>    
-----------------------------------------------------------------------------
Msg == [r : Replica, seq : Nat, vc : Vector, abuf : SUBSET Element, rbuf: SUBSET Element] \*message type
\* instantiate a reliable causal network
Network == INSTANCE ReliableCausalNetwork                                                 

\* read the state of r\in Replica 
Read(r, s) == {ele.d: ele \in s} 
\* instantiate SEC module                                                       
SEC == INSTANCE OpSEC WITH data <- set                                               
-----------------------------------------------------------------------------
TypeOK ==  \*check types
    /\ set \in [Replica -> SUBSET Element]
    /\ abuf \in [Replica -> SUBSET Element]
    /\ rbuf \in [Replica -> SUBSET Element]
    /\ IntTypeOK
    /\ Network!SMTypeOK
    /\ SEC!SECTypeOK
(*
1
1
1
1
1
1
*)
-----------------------------------------------------------------------------
Init ==     \* initial state
    /\ set = [r \in Replica |-> {}] 
    /\ abuf = [r \in Replica |-> {}]
    /\ rbuf = [r \in Replica |-> {}]
    /\ IntInit
    /\ Network!RCInit
    /\ SEC!OpSECInit
-----------------------------------------------------------------------------                                    
Send(r) ==     \* r\in Replica sends a message 
    /\ abuf' = [abuf EXCEPT ![r] = {}]
    /\ rbuf' = [rbuf EXCEPT ![r] = {}]
    /\ Network!RCBroadcast(r, [r |-> r, seq |-> seq[r], vc |-> [vc EXCEPT ![r][r] = @ + 1][r], 
                                                                abuf|-> abuf[r], rbuf|-> rbuf[r] ])
    /\ SEC!OpSECSend(r, seq[r])
    /\ IntSend(r)
    /\ UNCHANGED <<set>>  
              
Deliver(r) ==  \* r\in Replica receives a message 
    /\ Network!RCDeliver(r)
    /\ SEC!OpSECDeliver(r, [r |-> lmsg'.r, seq |-> lmsg'.seq])
    /\ set' = [set EXCEPT ![r] = (@ \cup lmsg'.abuf) \ lmsg'.rbuf]
    /\ IntDeliver(r)
    /\ UNCHANGED <<abuf, rbuf>>         
-----------------------------------------------------------------------------
Add(d, r) ==     \* r\in Replica adds d \in Data
    /\ set' = [set EXCEPT ![r] = @ \union {[d |-> d, r |-> r, k |-> seq[r]]}] 
    /\ abuf'= [abuf EXCEPT ![r] = @ \union {[d |-> d, r |-> r, k |-> seq[r]]}] 
    /\ IntDo(r)
    /\ Network!RCDo
    /\ SEC!OpSECUpdate(r, seq[r])
    /\ UNCHANGED <<rbuf>>     

Remove(d, r) ==  \* r\in Replica removes d \in Data
    /\ {ele \in set[r] : ele.d = d} # {}
    /\ LET D == {ele \in set[r] : ele.d = d}
       IN /\  set' = [set EXCEPT ![r] = @ \ D]  
          /\  rbuf' = [rbuf EXCEPT ![r] = @ \cup D]  
    /\ IntDo(r)
    /\ Network!RCDo
    /\ SEC!OpSECUpdate(r, seq[r])
    /\ UNCHANGED <<abuf>>  
    
Do(r) ==         \* update operations
    \E d \in Data : Add(d, r) \/ Remove(d, r)         
-----------------------------------------------------------------------------
Next ==                      \* next-state relation
    \E r \in Replica: 
        Deliver(r) \/ Send(r) \/ Do(r)

Spec == Init /\ [][Next]_vars\* specification
-----------------------------------------------------------------------------
\*SECa == \A r1, r2 \in Replica : 
\*            SEC!Sameupdate(r1, r2) => Read(r1) = Read(r2)
=============================================================================
\* Modification History
\* Last modified Thu Jun 13 21:46:27 CST 2019 by xhdn
\* Created Fri May 24 14:12:26 CST 2019 by xhdn
