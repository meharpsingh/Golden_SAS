data seebeta;
%let N =10000;
call streaminit (1234);
a= 3; b= 13;
do i=1 to &N;
y = rand("beta", a, b );
output;
end;
run;
