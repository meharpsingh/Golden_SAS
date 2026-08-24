data hex2dec_example;
input nums Hex2.;
datalines;
FF
AF
;
run;
proc print data=work.hex2dec_example;
run;
