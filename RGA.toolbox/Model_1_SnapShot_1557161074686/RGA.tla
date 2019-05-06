-------------------------------- MODULE RGA --------------------------------
EXTENDS Integers, Sequences, Naturals, TLC, InsertTree, SEC
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
    messageset    \* network variable

    
vars == <<tree, tomb, insbuf, tombbuf, chins, seq, incoming, msg, messageset, SECvars>>
-----------------------------------------------------------------------------  
vector == [Replica -> Nat]

Msg == [r : Replica, vc: vector, seq : Nat, tombbuf : SUBSET node, insbuf : SUBSET Char, update : SUBSET Update]

List == Seq(Char) 

RECURSIVE maxtime(_,_)
maxtime(tr, curmax) == IF tr = {} THEN curmax
                         ELSE  LET t == CHOOSE x \in tr: TRUE
                         IN maxtime(tr\{t}, Nummax((t.ts).time, curmax))
-----------------------------------------------------------------------------
Network == INSTANCE Network                     
-----------------------------------------------------------------------------
TypeOK == 
    /\ tree \in [Replica -> SUBSET node]
    /\ tomb \in [Replica -> SUBSET Char]
    /\ insbuf \in [Replica -> SUBSET node]
    /\ tombbuf \in [Replica -> SUBSET Char]
    /\ chins \in SUBSET Char
-----------------------------------------------------------------------------         
                      
Init == 
    /\ Network!NInit
    /\ SECInit
    /\ tree = [r \in Replica |-> {}]
    /\ tomb = [r \in Replica |-> {}]
    /\ insbuf = [r \in Replica |-> {}]
    /\ tombbuf = [r \in Replica |-> {}]
    /\ chins = Char
    /\ seq = [r \in Replica |-> 0]

    
DoIns(r) ==
    \E ins \in node:
        /\ ins.parent \in Readtree2set(tree[r]) \cup {"o"}
        /\ ins.ts  = [r|->r, time |->maxtime(tree[r], 1)]
        /\ ins.ch \in chins
        /\ chins' = chins \ {ins.ch} 
        /\ tree' =  [tree  EXCEPT![r] = @ \cup {ins}] 
        /\ insbuf' = [insbuf EXCEPT![r] = @ \cup {ins}] 
        /\ seq' = [seq EXCEPT ![r] = @ + 1]
        /\ SECUpdate(r, seq[r])
        /\ UNCHANGED <<incoming, msg, messageset, tomb, tombbuf>>


DoDel(r) == 
    \E del \in Char:
        /\ del \in Readtree2set(tree[r])
        /\ ~ del \in tomb[r]
        /\ tomb' = [tomb EXCEPT ![r] = @ \cup {del}] 
        /\ tombbuf' = [tombbuf EXCEPT ![r] = @ \cup {del}] 
        /\ seq' = [seq EXCEPT ![r] = @ + 1]
        /\ SECUpdate(r, seq[r])
        /\ UNCHANGED <<chins, tree, insbuf, incoming, msg, messageset>>
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
     /\ Network!NBroadcast(r, [r |-> r, seq |-> seq[r], update|-> OpUpdate(r), tombbuf |-> tombbuf[r], insbuf |-> insbuf[r]])
     /\ SECSend(r)
     /\ tombbuf' = [tombbuf EXCEPT ![r] = {}]
     /\ insbuf' = [insbuf EXCEPT![r] = {}] 
     /\ UNCHANGED <<chins, seq, tree, tomb>>

(* 
receive transitions
*)
Receive(r) ==
    /\ Network!NDeliver(r)
    /\ SECDeliver(r, msg'[r])
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
              
SEC == \E r1, r2 \in Replica : Sameupdate(r1, r2)
            => Readtree2list(tree[r1],"o",tomb[r1],{})= Readtree2list(tree[r2],"o",tomb[r2],{})                        
=============================================================================
\* Modification History
\* Last modified Tue May 07 00:42:00 CST 2019 by xhdn
\* Last modified Mon May 06 16:52:19 CST 2019 by jywellin
\* Last modified Thu Jan 10 15:34:04 CST 2019 by jywellins
\* Created Tue Nov 06 15:55:23 CST 2018 by xhdn
