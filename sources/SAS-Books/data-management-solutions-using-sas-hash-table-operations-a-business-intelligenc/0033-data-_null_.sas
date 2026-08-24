data _null_ ;
dcl hash H (multidata:"Y", ordered:"N") ;
H.definekey ("K") ;
H.definedata ("D") ;
H.definedone () ;
do K = 1, 2, 2, 3, 3, 3 ;
q + 1 ;
D = char ("ABCDEF", q) ;
H.ADD() ;
end ;
h.output(dataset: "AsLoaded") ;
/*...Insert demo code snippets below this line...*/
stop ;
run ;
