data temp;
   set yr12;
   year = 2000 + 12; ➋
   run;
proc datasets lib=work nolist; ➌
   append base=allyear data=temp;
   quit;
data temp;
   set yr13;
   year = 2000 + 13; ➋
   run;
proc datasets lib=work nolist; ➌
   append base=allyear data=temp;
   quit;
data temp;
   set yr14;
   year = 2000 + 14; ➋
   run;
proc datasets lib=work nolist; ➌
   append base=allyear data=temp;
   quit;
