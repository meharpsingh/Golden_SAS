data Forward (keep=ItemNo K D)
Backward(keep=ItemNo K D)
;
dcl hash H
(multidata:"Y", ordered:"N") ;
H.definekey ("K") ;
H.definedata ("D", "K") ;
H.definedone () ;
do K = 1, 2, 2, 3, 3, 3 ;
q + 1 ;
D = char ("ABCDEF", q) ;
H.add() ;
end ;
❶
 dcl hiter IH ("H") ;
do ItemNo = 1 to H.Num_Items ;
❷
 RC = IH.NEXT() ;
❸
 output Forward ;
end ;
/* end of forward loop */
❹
 do ItemNo = H.Num_Items - 1 by -1 to 1 ; ❺
 RC = IH.PREV() ;
❻
 output Backward ;
end ;
run ;
