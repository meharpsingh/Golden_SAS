data _null_ ;
retain Orders "ADN" ;
dcl hash H ;
do i = 1 to 3 ;
H = _NEW_ hash (ORDERED: char (Orders, i)) ;
end ;
run ;
