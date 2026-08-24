%macro princlin(clnum=123456);
data clin&clnum;
   set macro3.clinics(where=(clinnum="&clnum")) ➊
       end=eof; ➋
   if eof ➌ then call symputx('clname',clinname,'l'); ➍
   run;
title1 "Data for &clname"; ➎
proc print data=clin&clnum;
   var lname fname dob symp;
   run;
%mend princlin;
