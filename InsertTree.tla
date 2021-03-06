----------------------------- MODULE InsertTree -----------------------------
EXTENDS Integers, Sequences, Naturals, TLC, CRDTInterface
-----------------------------------------------------------------------------
CONSTANT Char, Charnum
-----------------------------------------------------------------------------
ts == [r : Replica, time : Nat]
node == [ch: Char, ts: ts, parent:Char \cup {"o"}]  
id ==[r1 |-> 1, r2 |-> 2, r3 |-> 3, r4 |-> 4, r5 |-> 5]

Ge(ts1, ts2) == IF ts1.time > ts2.time THEN TRUE
                                       ELSE IF id[ts1.r] > id[ts2.r] /\ ts1.time = ts2.time THEN TRUE
                                                                                            ELSE FALSE
                               
Setmax(ts1, ts2) == IF Ge(ts1, ts2) THEN ts1 ELSE ts2
Nummax(a, b) == IF a>b THEN a ELSE b
-----------------------------------------------------------------------------
\*nodechar == <<"o">>
RECURSIVE Readtree2set(_)
Readtree2set(T) == IF T = {} THEN {}
                    ELSE LET t == CHOOSE x \in T: TRUE
                    IN {t.ch} \cup Readtree2set(T \ {t})
                    
(*RECURSIVE Createtree(_,_)
Createtree(num,tree) == IF num = 0 THEN tree
                        ELSE LET i == CHOOSE x \in node:x.time = Charnum - num + 1 /\ x.father \in Readtree2set(tree) \cup {"o"} /\ x.ch \in Char \ Readtree2set(tree)
                                    IN  Createtree(num-1,tree \cup {i})  *)      
                      

RECURSIVE max(_,_,_,_)
max(T,root,curmax,readchar) == 
    CASE  \E i \in T : i.parent = root /\ Ge(i.ts, curmax) /\ ~ i.ch \in readchar ->
        LET i == CHOOSE x \in T :  x.parent = root /\ Ge(x.ts, curmax) /\ ~ x.ch \in readchar
            IN  max(T \{i}, root, i.ts, readchar)
    []    \E i \in T : i.parent = root /\ ~ Ge(i.ts, curmax) /\ ~ i.ch \in readchar -> 
        LET i == CHOOSE x \in T :  x.parent = root /\ ~ Ge(x.ts, curmax) /\ ~ x.ch \in readchar
            IN  max(T \{i}, root, curmax, readchar)
    [] OTHER -> curmax
    
RECURSIVE Readtree2list(_,_,_,_)
Readtree2list(T,root,tomb,readchar) == 
                    IF \E x \in T : x.parent = root /\ ~ x.ch \in tomb  
                                    /\ x.ts = max (T,root, x.ts, readchar) /\ ~ x.ch \in readchar
                         THEN LET i == CHOOSE x \in T : x.parent = root /\ ~ x.ch \in tomb 
                                    /\  x.ts = max (T,root, x.ts, readchar) /\ ~ x.ch \in readchar
                            IN <<i.ch>> \o Readtree2list(T, i.ch, tomb, readchar \cup{i.ch} ) 
                    ELSE IF \E x \in T : x.parent = root /\ x.ch \in tomb  
                            /\ x.ts = max (T, root, x.ts, readchar) /\ ~ x.ch \in readchar
                         THEN   LET i == CHOOSE x \in T : x.parent = root /\  x.ch \in tomb  
                                       /\ x.ts = max (T, root, x.ts, readchar) /\ ~ x.ch \in readchar
                            IN  Readtree2list(T, i.ch, tomb, readchar \cup{i.ch})                                                                                   
                    ELSE  IF \E x \in T : root = x.ch 
                         THEN   LET i == CHOOSE x \in T : root = x.ch
                            IN Readtree2list(T, i.parent, tomb, readchar)     
                    ELSE  <<>>       
                                     
\* Readtree2list(Createtree(3,{}),"o",{},{})
=============================================================================
\* Modification History
\* Last modified Wed Oct 23 21:30:46 CST 2019 by JYwellin
\* Last modified Mon May 06 16:46:42 CST 2019 by jywellin
\* Last modified Wed Apr 17 18:45:47 CST 2019 by xhdn
\* Created Fri Nov 30 15:07:41 CST 2018 by jywellin
