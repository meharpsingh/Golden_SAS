data cdf;
do x = -3 to 3 by 0.1;
y = cdf("Normal", x);
output;
end;
run;
