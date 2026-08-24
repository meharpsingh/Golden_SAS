%macro cc(data=,id=,time=,response=,out=);
%if %bquote(&data)= %then %let data=&syslast;
proc freq data=&data noprint;
tables &id /out=freqsub;
tables &time / out=freqtime;
run;
proc iml;
use freqsub;
Analysis of Incomplete Data
read all var {&id,count};
nsub = nrow(&id);
use freqtime;
read all var {&time,count};
ntime = nrow(&time);
use &data;
read all var {&id,&time,&response};
n =
nrow(&response);
complete = j(n,1,1);
ind = 1;
do while (ind <= nsub);
if (&response[(ind-1)*ntime+ntime]=.) then
complete[(ind-1)*ntime+1:(ind-1)*ntime+ntime]=0;
ind = ind+1;
end;
create help var {&id &time &response complete};
append;
quit;
data &out;
merge &data help;
if complete=0 then delete;
drop complete;
run;
%mend;
