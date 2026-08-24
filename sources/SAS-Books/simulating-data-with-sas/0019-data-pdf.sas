data pdf;
do x = -3 to 3 by 0.1;
y = pdf("Normal", x);
output;
end;
run;
