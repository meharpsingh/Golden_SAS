data Table(keep=x);
call streaminit(4321);
p1 = 0.5; p2 = 0.2; p3 = 0.3;
do i = 1 to &N;
x = rand("Table", p1, p2, p3);
/* sample with replacement */
output;
end;
run;
proc freq data=Table;
tables x / nocum;
run;
