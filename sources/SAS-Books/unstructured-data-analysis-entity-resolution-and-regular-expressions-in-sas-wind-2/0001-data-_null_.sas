data _NULL_;
if _N_=1 then
do;
    retain pattern_ID;
    pattern="/METACHARACTERS AND CHARACTERS GO HERE/"; /*<--Edit the pattern
here.*/
    pattern_ID=prxparse(pattern);
end;
input some_data $50.;
call prxsubstr(pattern_ID, some_data, position, length);
if position ^= 0 then
   do;
      match=substr(some_data, position, length);
      put match:$QUOTE. "found in " some_data:$QUOTE.;
   end;
datalines;
Smith, BOB A.
ROBERT Allen Smith
Smithe, Cindy
;
