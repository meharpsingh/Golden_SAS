%macro locf(data=,id=,time=,response=,out=);
%if %bquote(&data)= %then %let data=&syslast;
proc freq data=&data noprint;
tables &id /out=freqsub;
tables &time / out=freqtime;
run;
proc iml;
use freqsub;
read all var {&id,count};
nsub = nrow(&id);
use freqtime;
read all var {&time,count};
ntime = nrow(&time);
use &data;
read all var {&id,&time,&response};
n =
nrow(&response);
locf = &response;
ind = 1;
do while (ind <= nsub);
if (&response[(ind-1)*ntime+ntime]=.) then
do;
i = 1;
do while (&response[(ind-1)*ntime+i]^=.);
i = i+1;
end;
