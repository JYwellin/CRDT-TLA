----------------------------- MODULE Message ------------------------------
VARIABLES updateset
-----------------------------------------------------------------------------
CONSTANTS 
    Replica,
    Msg
    
NotMsg == CHOOSE m : m \notin Msg
-----------------------------------------------------------------------------
Msgid(m) == [r |-> m.r, seq |-> m.seq] 
delivermsg(m, r) == Msgid(m) \in updateset[r]
-----------------------------------------------------------------------------
Minit == 
    updateset = [r \in Replica |-> {}]

AddUpdate(r, m) == 
    updateset' = [updateset EXCEPT ![r] = @ \cup {Msgid(m)}]   
    
-----------------------------------------------------------------------------    
Sameupdate(r1, r2) == 
    updateset[r2] = updateset[r2]
=============================================================================
\* Modification History
\* Last modified Sun Apr 28 14:14:32 CST 2019 by jywellin
\* Last modified Sun Apr 21 18:45:44 CST 2019 by xhdn
\* Created Sat Apr 20 22:31:38 CST 2019 by xhdn
