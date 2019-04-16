----------------------------- MODULE InsertTree -----------------------------
EXTENDS Integers,Sequences,Naturals,TLC
-----------------------------------------------------------------------------
CONSTANT Char,Charnum
-----------------------------------------------------------------------------
node == [ch:Char,time:Int,parent:Char \cup {"o"}]  

\*nodechar == <<"o">>
RECURSIVE Readtree2set(_)
Readtree2set(T) == IF T = {} THEN {}
                    ELSE LET t == CHOOSE x \in T: TRUE
                    IN {t.ch} \cup Readtree2set(T \ {t})
                    
RECURSIVE Createtree(_,_)
Createtree(num,tree) == IF num = 0 THEN tree
                        ELSE LET i == CHOOSE x \in node:x.time = Charnum - num + 1 /\ x.father \in Readtree2set(tree) \cup {"o"} /\ x.ch \in Char \ Readtree2set(tree)
                                    IN  Createtree(num-1,tree \cup {i})        
                      

RECURSIVE max(_,_,_,_)
max(T,root,curmax,readchar) == 
    CASE  \E i \in T : i.parent = root /\ i.time > curmax /\ ~ i.ch \in readchar ->
        LET i == CHOOSE x \in T :  x.parent = root /\ x.time > curmax /\ ~ x.ch \in readchar
            IN  max(T \{i},root,i.time,readchar)
    []    \E i \in T : i.parent = root /\ i.time <= curmax /\ ~ i.ch \in readchar -> 
        LET i == CHOOSE x \in T :  x.parent = root /\ x.time <= curmax /\ ~ x.ch \in readchar
            IN  max(T \{i},root,curmax,readchar)
    [] OTHER -> curmax
    
RECURSIVE Readtree2list(_,_,_,_)
Readtree2list(T,root,tomb,readchar) == 
                    IF \E x \in T : x.parent = root /\ ~ x.ch \in tomb  
                                    /\ x.time = max (T,root,0,readchar) /\ ~ x.ch \in readchar
                         THEN LET i == CHOOSE x \in T : x.parent = root /\ ~ x.ch \in tomb 
                                    /\  x.time = max (T,root,0,readchar) /\ ~ x.ch \in readchar
                            IN <<i.ch>> \o Readtree2list(T, i.ch, tomb, readchar \cup{i.ch} ) 
                    ELSE IF \E x \in T : x.parent = root /\ x.ch \in tomb  
                            /\ x.time = max (T,root,0,readchar) /\ ~ x.ch \in readchar
                         THEN   LET i == CHOOSE x \in T : x.parent = root /\  x.ch \in tomb  
                                       /\ x.time = max (T,root,0,readchar) /\ ~ x.ch \in readchar
                            IN  Readtree2list(T, i.ch, tomb, readchar \cup{i.ch})                                                                                   
                    ELSE  IF \E x \in T : root = x.ch 
                         THEN   LET i == CHOOSE x \in T : root = x.ch
                            IN Readtree2list(T,i.parent,tomb,readchar)     
                    ELSE  <<>>       
                                     
\* Readtree2list(Createtree(3,{}),"o",{},{})
=============================================================================
\* Modification History
\* Last modified Thu Jan 10 15:39:10 CST 2019 by jywellin
\* Created Fri Nov 30 15:07:41 CST 2018 by jywellin
