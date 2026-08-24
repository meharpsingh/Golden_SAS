data _null_ ;
dcl hash H (multidata:"Y") ;
H.definekey ("K") ;
H.definedata("D") ;
H.definedone() ;
do K = 1, 2, 2 ;
q + 1 ;
D = char ("ABC", q) ;
rc = H.add() ;
end ;
rc = H.REMOVE() ; *implicit/assigned call
run ;
