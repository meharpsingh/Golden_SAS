data _null_ ;
dcl hash H () ;
H.definekey ("K") ;
H.definedata ("D") ;
H.definedone() ;
K = 1 ;
D = "A" ;
rc = H.ADD() ;
run ;
