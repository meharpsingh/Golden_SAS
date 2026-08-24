data Weight;
   input Wt $ @@;
   Wt_Kg = input(compress(Wt,,'kd'),12.);
   if findc(Wt,'L','i') then Wt_Kg = Wt_Kg / 2.2;
datalines;
120lbs. 90Kg 80Kgs. 200Lb
;
title "Listing of Data Set Weight";
proc print data=Weight noobs;
run;
