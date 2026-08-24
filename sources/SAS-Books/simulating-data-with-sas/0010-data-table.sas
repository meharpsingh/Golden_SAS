data Table(keep=x);
call streaminit(4321);
array p[3] _temporary_ (0.5 0.2 0.3);
do i = 1 to &N;
x = rand("Table", of p[*]);
/* sample with replacement */
output;
end;
run;
