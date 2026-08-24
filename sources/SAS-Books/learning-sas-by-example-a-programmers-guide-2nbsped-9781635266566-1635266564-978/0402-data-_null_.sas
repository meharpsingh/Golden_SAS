data _null_;
   file print;
   input Plate_No $10.;
   if not prxmatch("/[A-Z]\d\d\d/",Plate_No) then
      put "Plate number " Plate_No "does not conform to pattern";
datalines;
ABC123
SASMAN
SASJEDI
345XYZ
low987
WWW999
;
*27-3;
title "List of Non-standard Phone Numbers";
data _null_;
   file print;
   retain Return;
   if _n_ = 1 then Return = prxparse("/\d\d\d\.\d\d\d\.\d\d\d\d/");
   input Phone $13.;
   if not prxmatch(Return,Phone) then
      put "Phone number " Phone "does not conform to pattern";
datalines;
(908)432-1234
800.343.1234
8882324444
(888)456-1324
;
