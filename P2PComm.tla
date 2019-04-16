------------------------------ MODULE P2PComm ------------------------------
EXTENDS Naturals,Sequences
-----------------------------------------------------------------------------
CONSTANTS Replica
-----------------------------------------------------------------------------
VARIABLES
    incoming,outbuf
    
vars == <<incoming,outbuf>>
-----------------------------------------------------------------------------
Init == 
    /\ incoming = [r \in Replica |-> {}]
    /\ outbuf = [r \in Replica |-> {}]

(* 
receive transitions
*)
Receive(r) == 
    /\ incoming[r] # {}  
    /\ incoming' = [incoming EXCEPT ![r] = {}]
    /\ UNCHANGED <<outbuf>>

(* 
send transitions
*)
Send(r) == 
    /\ outbuf[r] # {}
    /\ incoming' = [x \in Replica |->
                        IF x = r
                        THEN incoming[x]
                        ELSE incoming[x] \cup outbuf[r]]
    /\ outbuf' =[outbuf EXCEPT ![r] ={}]
-----------------------------------------------------------------------------
(*
channel is empty iff incoming and outbuf are both empty for every replica.
*)
EmptyChannel == Init
=============================================================================

\* Modification History
\* Last modified Tue Dec 18 00:33:30 CST 2018 by xhdn
\* Last modified Sat Dec 15 21:09:02 CST 2018 by xhdn
\* Last modified Thu Dec 13 22:46:54 CST 2018 by jywellin
\* Created Fri Nov 30 14:43:28 CST 2018 by jywellin
