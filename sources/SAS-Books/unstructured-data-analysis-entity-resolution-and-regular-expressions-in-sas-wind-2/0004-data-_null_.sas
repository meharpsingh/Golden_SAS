data _NULL_;
input address $50.;
position = PRXMATCH('/Street/o', address);
if position ^= 0 then
   do;
      put position=;
   end;
datalines;
;
