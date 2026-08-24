data _null_;
   file print;
   input Zip $10.;
  if not prxmatch("/\d{5}(-\d{4})?/",Zip) then
      put "Invalid Zip Code " Zip;
datalines;


12345
78010-5049
12Z44
ABCDE
08822
;
