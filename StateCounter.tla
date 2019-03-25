---------------------------- MODULE StateCounter ----------------------------
EXTENDS Naturals, Sequences, Bags, TLC
-----------------------------------------------------------------------------
CONSTANTS 
    Replica
    
-----------------------------------------------------------------------------    
VARIABLES 
    state, incoming, update 
    vars == <<state, incoming,update>>
    
vector == [Replica -> Nat]
initvector == [r \in Replica |-> 0]
-----------------------------------------------------------------------------
TypeOK == /\ state \in [Replica -> vector]
          /\ update \in [Replica -> {0,1}]
          
-----------------------------------------------------------------------------
Init == /\ state = [r \in Replica |-> initvector]
        /\ incoming = [r \in Replica |-> EmptyBag]
        /\ update = [r \in Replica |-> 0]
        
 -----------------------------------------------------------------------------       
\*count(x,sum) == count(sum) + 
\*read(r) == count(state[r],0)

inc(r) == /\ state' = [state EXCEPT ![r][r] = @ + 1]
          /\ update' = [update EXCEPT![r] = 1]
          /\ UNCHANGED <<incoming>>


send(r) == /\ incoming' = [x \in Replica |->
                        IF x = r
                        THEN incoming[x]
                        ELSE incoming[x] (+) SetToBag({state[r]})]
           /\ update' = [update EXCEPT![r] = 0]
           /\ UNCHANGED <<state>>
   

SetMax(r, s) == IF r > s THEN r ELSE s
    
receive(r) == /\ incoming[r] # EmptyBag  
              /\ \E m \in BagToSet(incoming[r]):  
                    (/\ \A s \in Replica: state' = [state EXCEPT ![r][s] = SetMax(@, m[s])]
                     /\ incoming' = [incoming EXCEPT ![r] = @ (-) SetToBag({m})])                   
              /\ UNCHANGED <<update>>
-----------------------------------------------------------------------------
Next == /\ \E r \in Replica: inc(r) \/ send(r) \/ receive(r)
-----------------------------------------------------------------------------
Spec == Init /\ [][Next]_vars
-----------------------------------------------------------------------------
EmptyChannel ==  incoming = [r \in Replica |-> EmptyBag]
EmptyUpdate == update = [r \in Replica |-> 0 ]
EC == EmptyChannel /\ EmptyUpdate
            => \A r,s \in Replica : state[r] = state[s]

=============================================================================
\* Modification History
\* Last modified Mon Mar 25 19:47:02 CST 2019 by jywellin
\* Created Mon Mar 25 14:25:48 CST 2019 by jywellin
