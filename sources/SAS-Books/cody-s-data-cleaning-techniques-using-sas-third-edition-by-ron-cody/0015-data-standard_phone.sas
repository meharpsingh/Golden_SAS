data Standard_Phone;
   input Phone $16.;
   Digits = compress(Phone,,'kd');
   Phone = cats('(',substr(Digits,1,3),')',substr(Digits,4,3),
      '-',substr(Digits,7));
   drop Digits;
datalines;
(908)123-1234
609.455-7654
2107829999
(800) 123-4567
;
run;
title "Listing of Standardized Phone Numbers";
proc print data=Standard_Phone noobs;
run;
