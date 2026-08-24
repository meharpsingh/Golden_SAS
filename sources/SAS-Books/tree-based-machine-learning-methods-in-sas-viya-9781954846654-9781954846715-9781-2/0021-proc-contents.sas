proc contents data=mycas.bigpva out=contents(keep=name type);
run;
/* Creating macro variable for interval inputs */
proc sql; select name into: interval separated by " "
from work.contents
where type=1 and name not in("TARGET_B" "TARGET_D"
"TARGET_D_with0" "StatusCatStarAll");
quit; %put &interval;
/* Creating macro variable for nominal inputs */
proc sql; select name into: nominal separated by " "
from work.contents
where (type=2 or name = "StatusCatStarAll") and name ne "ID";
quit;
%put &nominal;
/* Exploring data */
proc univariate data=mycas.bigpva;
            var Target_D Target_D_with0;
            histogram Target_D Target_D_with0;
run;
