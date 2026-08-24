%let N = 100;
/* size of sample
*/
data Calls(drop=i);
call streaminit(12345);
array prob [3] _temporary_ (0.5 0.3 0.2);
do i = 1 to &N;
type = rand("Table", of prob[*]);
/* returns 1, 2, or 3 */
if type=1 then
x = rand("Normal",
3, 1);
else if type=2 then x = rand("Normal",
8, 2);
else
x = rand("Normal", 10, 3);
output;
end;
run;
proc univariate data=Calls;
ods select Histogram;
histogram x / vscale=proportion
kernel(lower=0 c=SJPI);
run;
