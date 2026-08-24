data studdrop;
merge pred dropout;
if (pred=.) then delete;
run;
data wgt (keep=patient wi);
set studdrop;
by patient;
retain wi;
if first.patient then wi=1;
if not last.patient then wi=wi*(1-pred);
if last.patient then do;
if visit<8 then wi=wi*pred;
/* DROPOUT BEFORE LAST OBSERVATION */
else wi=wi*(1-pred);
/* NO DROPOUT */
wi=1/wi;
output;
end;
run;
data total;
merge dropout wgt;
by patient;
run;
