data _null_ ;
dcl hash H() ;
H.defineKey ("Player_ID","Team_SK") ;
H.defineData("First_name","Last_name","Position_code") ;
H.defineDone() ;
stop ;
set bizarro.Player_candidates ;
run ;
