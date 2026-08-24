data _null_;
   file print;
   input Email $50.;
   if not prxmatch("/\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,6}\b/i",
     Email) then
     put "Invalid Email Address " Email;
datalines;
Jeff.Clark@google.com
no_at_sign_here
1234567890.1234567
fred@rr.tt.org
Bill_Baker@Kerrville.edu
A.B.C@def.too_long
;
