-------------------------------- MODULE RGA --------------------------------
EXTENDS Integers,Sequences,Naturals,TLC,InsertTree
-----------------------------------------------------------------------------      
VARIABLES 
    tree,
    tomb,
    insbuf,
    tombbuf,
    chins,
    seq,
    incoming,      \* network variable
    msg,           \* network variable
    updateset,     \* network variable
    vc             \* network variable
    
vars == <<tree, tomb, insbuf, tombbuf, chins, incoming, msg, updateset, vc, seq>>
-----------------------------------------------------------------------------  
vector == [Replica -> Nat]

Msg == [r : Replica, vc: vector, seq : Nat, tombbuf : SUBSET node, insbuf : SUBSET Char]

List == Seq(Char) 

RECURSIVE maxtime(_,_)
maxtime(tr, curmax) == IF tr = {} THEN curmax
                         ELSE  LET t == CHOOSE x \in tree: TRUE
                         IN maxtime(tr\{t}, Nummax((t.ts).time, curmax))
-----------------------------------------------------------------------------
Network == INSTANCE CausalNetwork                     
-----------------------------------------------------------------------------
TypeOK == 
    /\ tree \in [Replica -> SUBSET node]
    /\ tomb \in [Replica -> SUBSET Char]
    /\ insbuf \in [Replica -> SUBSET node]
    /\ tombbuf \in [Replica -> SUBSET Char]
    /\ chins \in SUBSET Char
-----------------------------------------------------------------------------         
                      
Init == 
    /\ Network!Init
    /\ tree = [r \in Replica |-> {}]
    /\ tomb = [r \in Replica |-> {}]
    /\ insbuf = [r \in Replica |-> {}]
    /\ tombbuf = [r \in Replica |-> {}]
    /\ chins = Char
    /\ seq = [r \in Replica |-> 0]

    
DoIns(r) ==
    \E ins \in node:
        /\ ins.parent \in Readtree2set(tree[r]) \cup {"o"}
        /\ ins.ts  = [r|->r, time |->maxtime(tree[r], 0)]
        /\ ins.ch \in chins
        /\ chins' = chins \ {ins.ch} 
        /\ tree' =  [tree  EXCEPT![r] = @ \cup {ins}] 
        /\ insbuf' = [insbuf EXCEPT![r] = @ \cup {ins}] 
        /\ seq' = [seq EXCEPT ![r] = @ + 1]
        /\ UNCHANGED <<incoming, msg, updateset, vc, tomb, tombbuf>>


DoDel(r) == 
    \E del \in Char:
        /\ del \in Readtree2set(tree[r])
        /\ ~ del \in tomb[r]
        /\ tomb' = [tomb EXCEPT ![r] = @ \cup {del}] 
        /\ tombbuf' = [tombbuf EXCEPT ![r] = @ \cup {del}] 
        /\ seq' = [seq EXCEPT ![r] = @ + 1]
        /\ UNCHANGED <<chins, tree, insbuf, incoming, msg, updateset, vc>>
(* 
do transitions
*)     
Do(r) == 
    \/ DoIns(r)
    \/ DoDel(r)

(* 
send transitions
*)     
Send(r) ==
     /\ \/ tombbuf[r] # {}
        \/ insbuf[r] # {}
     /\ Network!Broadcast(r, [r |-> r, seq |-> seq[r], vc |-> [vc EXCEPT ![r][r] = @ + 1][r], tombbuf |-> tombbuf[r], insbuf |-> insbuf[r]])
     /\ tombbuf' = [tombbuf EXCEPT ![r] = {}]
     /\ insbuf' = [insbuf EXCEPT![r] = {}] 
     /\ UNCHANGED <<chins, seq, tree, tomb>>

(* 
receive transitions
*)
Receive(r) ==
    /\ Network!Deliver(r)
    /\ tree' =  [tree  EXCEPT![r] = @ \cup msg'[r].insbuf] 
    /\ tomb' = [tomb EXCEPT ![r] = @ \cup msg'[r].tombbuf]
    /\ UNCHANGED <<chins, seq, tombbuf, insbuf>> 
-----------------------------------------------------------------------------
Next == 
   \E r \in Replica: Do(r) \/ Send(r)\/ Receive(r)

-----------------------------------------------------------------------------                   
Spec == Init /\ [][Next]_vars   
 
-----------------------------------------------------------------------------
(*
eventual consistency              
*)
EmptyBuffer == tombbuf = [r \in Replica |-> {} ] /\ insbuf = [r \in Replica |-> {} ]
                               
EC == Network!EmptyChannel /\ EmptyBuffer
        =>  \A r1,r2  \in Replica:
              Readtree2list(tree[r1],"o",tomb[r1],{})= Readtree2list(tree[r2],"o",tomb[r2],{})      
              
SEC == \E r1, r2 \in Replica : Network!Sameupdate(r1, r2)
            => Readtree2list(tree[r1],"o",tomb[r1],{})= Readtree2list(tree[r2],"o",tomb[r2],{})                        
=============================================================================
\* Modification History
\* Last modified Wed Apr 17 17:24:59 CST 2019 by xhdn
\* Last modified Tue Apr 16 22:30:22 CST 2019 by jywellin
\* Last modified Thu Jan 10 15:34:04 CST 2019 by jywellins
\* Created Tue Nov 06 15:55:23 CST 2018 by xhdn
