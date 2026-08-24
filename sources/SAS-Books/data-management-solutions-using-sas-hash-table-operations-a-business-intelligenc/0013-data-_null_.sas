data _null_ ;
dcl hash H() ;
H.definekey("Player_ID") ;
H.definedata("Position_code") ;
H.definedone() ;
set bizarro.Player_candidates ;
*...rest of program;
run ;
