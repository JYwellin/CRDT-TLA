--------------------------- MODULE CausalNetwork ---------------------------
EXTENDS Sequences
-----------------------------------------------------------------------------
CONSTANTS Replica
-----------------------------------------------------------------------------
VARIABLES
    incoming, msg
    
vars == <<incoming, msg>>
-----------------------------------------------------------------------------
\* TypeOK == /\ \A r \in Replica:
-----------------------------------------------------------------------------
Init == /\ incoming = [r \in Replica |-> <<>>]
        /\ msg = [r \in Replica |-> 0]

Broadcast(r, m)== /\ incoming' = [x \in Replica |->
                        IF x = r
                        THEN incoming[x]
                        ELSE \/ incoming[x] \o m
                             \/ incoming[x]
                             \/ incoming[x] \o m \o m ]                            
                  /\ UNCHANGED <<msg>>

Deliver(r) == /\ incoming[r] # <<>>
              /\ LET m == Head(incoming[r])
                    IN  /\ msg' = [msg EXCEPT ![r] =  m]   
              /\ incoming' = [incoming EXCEPT ![r] = Tail(@)]     
                         
-----------------------------------------------------------------------------                          
EmptyChannel ==  incoming = [r \in Replica |-> <<>>]

=============================================================================
\* Modification History
\* Last modified Tue Apr 02 15:29:05 CST 2019 by jywellin
\* Created Wed Mar 27 20:03:44 CST 2019 by jywellin
