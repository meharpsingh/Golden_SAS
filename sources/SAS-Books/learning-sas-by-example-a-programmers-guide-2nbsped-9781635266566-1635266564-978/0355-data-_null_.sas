data _null_;
   file print;
   input SS $11.;
   retain Return_Code;
   if _n_ = 1 then
 Return_Code = prxparse("/\d\d\d-\d\d-\d\d\d\d/");
   if not prxmatch(Return_Code,SS) then
put "Error for SS Number " SS;
datalines;
123-45-6789
123456789
123-ab-9876
999-888-7777
;
