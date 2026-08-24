data _null_ ;
dcl hash H() ;
H.defineKey ("K") ;
H.defineData ("D") ;
H.defineDone () ;
❷
 do K = 1 to length ("ABCDEF") ; ❶
D = char ("ABCDEF", K) ;
