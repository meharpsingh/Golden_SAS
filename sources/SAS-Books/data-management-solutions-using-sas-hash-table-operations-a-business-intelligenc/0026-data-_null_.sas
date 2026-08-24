data _null_ ;
dcl hash H (dataset: "bizarro.Player_candidates") ;
H.definekey ("Player_ID") ;
H.definedata ("Player_ID", "Position_code") ;
H.definedone() ;
H.output (dataset: "Players") ; *Check content of H;
 stop ;
set bizarro.Player_candidates (keep = Player_ID Position_code) ;
run ;
