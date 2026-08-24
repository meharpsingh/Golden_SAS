data Reg1(drop=i);
call streaminit(1);
do i = 1 to &N;
x = rand("Normal");
z = rand("Normal");
y = 1 + 1*x + 0*z + rand("Normal");
/* eps ~ N(0,1) */
output;
end;
run;
proc reg data=Reg1;
model y = x z;
z0: test z=0;
ods select TestANOVA;
quit;
