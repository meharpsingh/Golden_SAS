data _null_ ;
do dupes = "Y", "N" ;
do order = "N", "A", "D" ;
dcl hash H
(multidata: dupes, ordered: order) ;
H.definekey ("K") ;
H.definedata ("K", "D") ;
H.definedone () ;
do K = 2, 3, 1 ;
do D = "A", "B", "C" ;
rc = h.add() ;
end ;
end ;
h.output (dataset:catx ("_", "Hash", dupes, order)) ;
end ;
end ;
run ;
