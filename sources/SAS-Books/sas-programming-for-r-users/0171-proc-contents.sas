proc contents data=&dt varnum out=dtcontents;
run;
proc sql;
select distinct name into: vars_cont separated by ' '
from dtcontents where type=1;
select distinct NAME into: vars_cat separated by ' '
from dtcontents where type=2;
quit;
