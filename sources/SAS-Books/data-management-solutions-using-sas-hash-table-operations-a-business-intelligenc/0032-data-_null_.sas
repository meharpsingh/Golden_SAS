data _null_ ;
do order = "N", "A", "D" ;
dcl hash H
(multidata:"Y", ORDERED:Order) ;
H.definekey ("K") ;
H.definedata ("K", "D") ;
H.definedone () ;
K = 1 ; D = "A" ; H.add() ;
K = 2 ; D = "B" ; H.add() ;
K = 2 ; D = "C" ; H.add() ;
K = 3 ; D = "D" ; H.add() ;
K = 3 ; D = "E" ; H.add() ;
K = 3 ; D = "F" ; H.add() ;
H.output (dataset: catx ("_", "Hash", Order)) ;
end ;
run ;
