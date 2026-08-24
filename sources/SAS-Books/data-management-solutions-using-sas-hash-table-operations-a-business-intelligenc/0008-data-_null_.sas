data _null_ ;
length arg $ 32767 ;
do x = 1 to 100 ;
arg = catx (",", arg, quote (cats ("D", x))) ;
end ;
call symputx ("arg", arg) ;
run ;
