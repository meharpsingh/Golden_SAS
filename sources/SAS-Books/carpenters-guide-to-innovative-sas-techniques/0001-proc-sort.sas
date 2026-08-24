libname toxls excel "&path\data\newwb.xls"; n
proc sort data=advrpt.demog
          out=toxls.demog; o
   by clinnum;
   run;
data getdemog;
   set toxls.demog; p
   run;
libname toxls clear; q
