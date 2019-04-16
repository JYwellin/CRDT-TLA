-------------------------------- MODULE RGAH --------------------------------
EXTENDS RGA,SequenceUtils
-----------------------------------------------------------------------------
VARIABLE list

varsH == <<vars, list>>

TypeOKH == TypeOK /\ (list \in SUBSET List)
-----------------------------------------------------------------------------
InitH == Init /\ list = {}

DoH(r) == Do(r) /\ list' = list \cup   { Readtree2list(rtree[r]',"o",rtomb[r]',{}) }

SendH(r) == Send(r) /\ list' = list

ReceiveH(r) == Receive(r) /\ list' = list \cup  { Readtree2list(rtree[r]',"o",rtomb[r]',{}) }
-----------------------------------------------------------------------------
NextH == 
   \E r \in Replica: DoH(r) \/ SendH(r) \/ ReceiveH(r)
-----------------------------------------------------------------------------   
SpecH == InitH /\ [][NextH]_varsH
-----------------------------------------------------------------------------  
(*
Weak List Consistency 
*)
WLSpec ==  \A l1, l2 \in list: 
                /\ Injective(l1) 
                /\ Injective(l2) 
                /\ Compatible(l1, l2)
(*
Strong List Consistency 
*)                
nocylce(seq1, seq2, seq3) ==
       LET commonElements1 == Range(seq1) \cap Range(seq2)
           commonElements2 == Range(seq2) \cap Range(seq3)
           commonElements3 == Range(seq3) \cap Range(seq1)
       IN \A e1 \in commonElements1, e2 \in commonElements2, e3 \in commonElements3:            
                 FirstIndexOfElement(seq1, e3) < FirstIndexOfElement(seq1, e1)  /\ FirstIndexOfElement(seq2, e1) < FirstIndexOfElement(seq2, e2)
               => FirstIndexOfElement(seq3, e3) < FirstIndexOfElement(seq3, e2)
               
SLSpec ==   /\ WLSpec
            /\ \A l1, l2,l3 \in list: 
                 nocylce(l1, l2, l3)                    
=============================================================================
\* Modification History
\* Last modified Mon Jan 14 16:17:49 CST 2019 by jywellin
\* Last modified Sat Dec 15 21:10:45 CST 2018 by xhdn
\* Last modified Sat Dec 15 12:40:54 CST 2018 by xhdn
\* Created Wed Dec 05 18:11:55 CST 2018 by jywellin
