----------------------------- MODULE StateAWSet -----------------------------
EXTENDS AWSet
-----------------------------------------------------------------------------
VARIABLES
    aset,     \* aset[r]: set of active Instance(s) maintained by r \in Replica
    tset,     \* tset[r]: set of tombstone Instance(s) maintained by r \in Replica
    
    (*
    network variables
    *) 
    incoming, \* incoming[r]: incoming messages at replica r \in Replica
    lmsg,
    (*
    SEC variables
    *) 
    updateset,
    uincoming
    
Nvars  == <<incoming, lmsg>>
SECvars == <<updateset, uincoming>> 
vars == <<aset, tset, seq, Nvars, SECvars>>
-----------------------------------------------------------------------------  
Msg == [r : Replica, seq : Nat, A: SUBSET Element, T : SUBSET Element]  \* message type
Network == INSTANCE BasicNetwork                                        \* instantiate basic network

Read(r, s) == {ele.d: ele \in s}                                        \* read the state of r\in Replica
SEC == INSTANCE StateSEC WITH data <- aset                              \* instantiate SEC module
-----------------------------------------------------------------------------    
TypeOK ==   \*check types
    /\ aset \in [Replica -> SUBSET Element]
    /\ tset \in [Replica -> SUBSET Element]
    /\ IntTypeOK
    /\ Network!SMTypeOK
    /\ SEC!SECTypeOK
-----------------------------------------------------------------------------
Init ==     \* initial state
    /\ aset = [r \in Replica |-> {}]
    /\ tset = [r \in Replica |-> {}]   
    /\ Network!NInit
    /\ SEC!StateSECInit
    /\ IntInit     
-----------------------------------------------------------------------------    
(*
1
1
1
1
1
1
1
1
*)                  
Send(r) ==     \* r\in Replica sends a message 
    /\ Network!NBroadcast(r,  [r |-> r, seq |-> seq[r],  A |-> aset[r], T |-> tset[r]])  
    /\ IntSend(r)
    /\ SEC!StateSECSend(r, seq[r]) 
    /\ UNCHANGED <<aset, tset>>
           
Deliver(r) ==  \* r\in Replica delivers a message(lmsg') 
    /\ Network!NDeliver(r)
    /\ IntDeliver(r)
    /\ SEC!StateSECDeliver(r, [r |-> lmsg'.r, seq |-> lmsg'.seq])
    /\ tset' = [tset EXCEPT ![r] = @ \cup lmsg'.T]
    /\ aset' = [aset EXCEPT ![r] = (@ \cup lmsg'.A) \ tset'[r]]           
    /\ UNCHANGED <<>> 
-----------------------------------------------------------------------------
Add(d, r) ==     \* r\in Replica adds d \in Data
    /\ aset'= [aset EXCEPT ![r] = @ \union {[d |-> d, r |-> r, k |-> seq[r]]}]
    /\ IntDo(r)
    /\ Network!NDo
    /\ SEC!StateSECUpdate(r, seq[r])
    /\ UNCHANGED <<tset>>
    
Remove(d, r) ==  \* r\in Replica removes d \in Data 
    /\ LET E == {ele \in aset[r] : ele.d = d}
       IN  /\ aset' = [aset EXCEPT ![r] = @ \ E]
           /\ tset' = [tset EXCEPT ![r] = @ \cup E] 
    /\ IntDo(r)
    /\ Network!NDo
    /\ SEC!StateSECUpdate(r, seq[r]) 
                      
Do(r) ==         \* update operations
    \E a \in Data: Add(a, r) \/ Remove(a, r)         
-----------------------------------------------------------------------------
Next ==                        \* next-state relation
    \E r \in Replica: Deliver(r) \/ Send(r) \/ Do(r)

Spec == Init /\ [][Next]_vars  \*specification
=============================================================================
\* Modification History
\* Last modified Thu Jun 13 21:45:44 CST 2019 by xhdn
\* Created Fri May 24 14:13:38 CST 2019 by xhdn
