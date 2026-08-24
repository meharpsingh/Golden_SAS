data _NULL_;
input some_data $50.;
pattern = "/\wun/o";
pattern_ID = PRXPARSE(pattern);
start = 1;
stop = length(some_data);
CALL PRXNEXT(pattern_ID, start, stop, some_data,
position, length);
   do while (position > 0);
      found = substr(some_data, position,
length);
      put "Line:" _N_ found= position= length=;
      CALL PRXNEXT(pattern_ID, start, stop,
some_data, position, length);
   end;
datalines;


Running Runners who run.
;
