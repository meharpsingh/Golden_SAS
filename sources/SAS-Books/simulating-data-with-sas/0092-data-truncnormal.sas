%let N = 100;
/* size of sample */
data TruncNormal(keep=x);
call streaminit(12345);
a = 0;
do i = 1 to &N;
do until( x>=a );
/* reject x < a
*/
x = rand("Normal");
end;
output;
end;
run;
