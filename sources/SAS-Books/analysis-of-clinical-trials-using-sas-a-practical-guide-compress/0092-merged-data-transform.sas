/* Merged listing: this program was assembled from 2 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0092-data-ecgeval.sas --- */
data ecgeval;
input therapy $ baseline endpoint count @@;
datalines;


;

/* --- 0093-data-transform.sas --- */
data transform;
set ecgeval;
if baseline+endpoint^=1 then change="Same";
if baseline=0 and endpoint=1 then change="Up";
if baseline=1 and endpoint=0 then change="Down";
proc sort data=transform;
by therapy change;
proc means data=transform noprint;
by therapy change;
var count;
output out=sum sum=sum;
data estimate;
set sum;
by therapy;
retain nminus nzero nplus;
if change="Same" then nzero=sum;
if change="Up" then nplus=sum;
if change="Down" then nminus=sum;
alpha=(nminus+nplus)/(nminus+nzero+nplus);
if nminus+nplus>0 then beta=nplus/(nminus+nplus); else beta=1;
if last.therapy=1;
keep therapy beta alpha;
proc print data=estimate noobs;
proc freq data=sum;
ods select LRChiSq;
table therapy*change;
exact lrchi;
weight sum;
run;
