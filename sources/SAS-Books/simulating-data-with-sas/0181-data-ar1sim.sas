%let N = 100;
%let NumSamples = 1000;
/* simulate 1,000 time series from model */
data AR1Sim(keep=SampleID t y);
phi = 0.4;
call streaminit(12345);
do SampleID = 1 to &NumSamples;
yLag = 0;
do t = -10 to &N;
y = phi*yLag + rand("Normal");
if t>0 then output;
yLag = y;
end;
end;
run;
/* estimate AR(1) model for each simulated time series */
proc arima data=AR1Sim plots=none;
by SampleID;
identify var=y nlag=1 noprint;
/* estimate AR1 lag */
estimate P=1 outest=AR1Est(where=(_TYPE_="EST")) noprint;
quit;
