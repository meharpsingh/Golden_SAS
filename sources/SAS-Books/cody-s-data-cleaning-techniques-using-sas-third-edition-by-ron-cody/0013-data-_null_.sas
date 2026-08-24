data _null_;
   First =  "/[ABCEFGHJ-NPQRSTVXY][0-9]";
   Second = "[ABCEFGHJ-NPRSTV-Z] ?[0-9]";
   Third =  "[ABCEFGHJ-NPRSTV-Z][0-9]/";
   file print;
   input CPC $7.;
   Regex = First||Second||Third;
   if not prxmatch(Regex,CPC) then
     put "Invalid Postal Code " CPC;
datalines;
A1B2C3
ABCDEF
A1B 2C3
12345
D5C6F7
;
