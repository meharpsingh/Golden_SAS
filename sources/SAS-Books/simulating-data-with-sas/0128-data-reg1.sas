%let N = 50;
/* size of each sample
*/
data Reg1(keep=x y);
call streaminit(1);
do i = 1 to &N;
x = rand("Uniform");
/* explanatory variable
*/
eps = rand("Normal", 0, 0.5);
/* error term
*/
y = 1 - 2*x + eps;
/* parameters are 1 and -2
*/
output;
end;
run;
proc reg data=Reg1;
model y = x;
ods exclude NObs;
quit;
