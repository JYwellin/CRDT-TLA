----------------------------- MODULE OpCounter -----------------------------
EXTENDS Naturals,Sequences,Bags

CONSTANTS Replica 
VARIABLE counter,buffer,incoming
vars == <<counter,buffer,incoming>>

TypeOK == /\ counter \in [Replica -> Nat]
          /\ buffer \in [Replica -> Nat]
          /\ \A r \in Replica:IsABag(incoming[r])
       \* /\ incoming \in [Replica -> SubBag(SetToBag(Nat))] 
          
Init == /\ counter = [r \in Replica |-> 0 ]
        /\ buffer = [r \in Replica |-> 0 ]
        /\ incoming = [r \in Replica |-> EmptyBag ]
        
read(r) == counter[r]

inc(r) == /\ counter' = [counter EXCEPT ![r] = @ + 1]
          /\ buffer' = [buffer EXCEPT ![r] = @ + 1]
          /\ UNCHANGED <<incoming>>

send(r) ==  /\ buffer[r] # 0
            /\ buffer' = [buffer EXCEPT ![r] = 0]
            /\ incoming' = [x \in Replica |->
                        IF x = r
                        THEN incoming[x]
                        ELSE incoming[x] (+) SetToBag({buffer[r]})]
            /\ UNCHANGED <<counter>>

receive(r) == /\ incoming[r] # EmptyBag
              /\ \E m \in BagToSet(incoming[r]):
                  ( /\ incoming' = [incoming EXCEPT ![r] = @ (-) SetToBag({m})]
                    /\ counter' = [counter EXCEPT ![r] = @ + m])
              /\ UNCHANGED <<buffer>>
              
-----------------------------------------------------------------------------
Next == 
   \E r \in Replica: inc(r) \/ send(r)\/ receive(r)

-----------------------------------------------------------------------------                   
Spec == Init /\ [][Next]_vars   
-----------------------------------------------------------------------------
EmptyChannel ==  incoming = [r \in Replica |-> EmptyBag]
EmptyBuffer == buffer = [r \in Replica |-> 0 ]
EC == EmptyChannel /\ EmptyBuffer
            => \A r,s \in Replica : counter[r] = counter[s]

=============================================================================
\* Modification History
\* Last modified Fri Mar 22 21:32:40 CST 2019 by jywellin
\* Created Fri Mar 22 20:43:27 CST 2019 by jywellin
