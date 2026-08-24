/* Merged listing: this program was assembled from 3 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0080-proc-plan.sas --- */
ods listing close;
proc plan seed=56789;
factors block=10 ordered arm=6 ordered;
treatments washout=6;
output out=washout washout nvals=(1 1 2 2 3 3);
data washout;
set washout;
label block='Block number'
arm='Base study arm'
washout='Washout';
proc print data=washout noobs label;
ods listing;
run;

/* --- 0081-data-regimens.sas --- */
data regimens;
set washout;
length switch $3.;
do subblock=1 to 3;
if washout=subblock then do;
switch='Yes';
treatment=arm*2;
end;
else do;
switch='No';
treatment=arm*2-1;
end;
random=ranuni(6789);
output;
end;
label block='Block number'
arm='Base study arm'
washout='Washout'
subblock='Sub-block'
switch='Switch to placebo?'
random='Random key'
treatment='Treatment group';
proc print data=regimens noobs label;
var block arm washout subblock switch random treatment;
run;

/* --- 0082-proc-sort.sas --- */
proc sort data=regimens out=schedule;
by block subblock random;
data schedule;
set schedule;
an=_n_;
label an='Allocation number';
proc print data=schedule noobs label;
var an arm switch block subblock treatment;
run;
