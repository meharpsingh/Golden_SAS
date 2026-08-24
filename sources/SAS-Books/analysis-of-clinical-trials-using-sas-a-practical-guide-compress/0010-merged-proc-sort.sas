/* Merged listing: this program was assembled from 3 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0010-data-urininc.sas --- */
data urininc;
input therapy $ stratum @@;
do i=1 to 10;
input change @@;
if (change^=.) then output;
end;
drop i;
datalines;
Placebo
-86
-38
43 -100
-78
-80
-25
Placebo
1 -100 -100
-50
25 -100 -100
-67
400 -100
Placebo
-63
-70
-83
-67
-33
-13 -100
-3
Placebo
-62
-29
-50 -100
0 -100
-60
-40
-44
-14
Placebo
-36
-77
-6
-85
-17
-53
-62
-93
Placebo
-29
-6 -100
-30
-52
-55
Placebo
2 -100
-82
-85
-36
-75
-8
-75
-42
-30
Placebo
-82
.
.
.
.
.
.
.
.
Placebo
-68 -100
-43
-17
-87
-66
-8
Placebo
-41
-73
-42
-32
-69
Drug
50 -100
-80
-57
-44
340 -100 -100
-25
-74
Drug
43 -100 -100 -100 -100
-63 -100 -100 -100
Drug
1 -100 -100
0 -100
-50
-83
-50
Drug
-33
-50
-33
-67
-50
0 -100
.
Drug
-93
-55
-73
-25
-92
-91
-89
-67
Drug
-25
-61
-47
-75
-94 -100
-69
-92 -100
-35
Drug
2 -100
-82
-31
-29 -100
-14
-55
-40 -100
Drug
-82
-60
.
.
.
.
.
.
.
Drug
-17
-13
-55
-85
-68
-87
-42
-44
-98
Drug
-75
-35
-57
-92
-78
-69
-21 -14
.
;

/* --- 0011-proc-sort.sas --- */
proc sort data=urininc;
by stratum therapy;
proc kde data=urininc out=density;
by stratum therapy;
var change;
proc sort data=density;
by stratum;
* Plot the distribution of the primary endpoint in each stratum;
%macro PlotDist(stratum,label);
axis1 minor=none major=none value=none label=(angle=90 "Density")
order=(0 to 0.012 by 0.002);
axis2 minor=none order=(-100 to 150 by 50)
label=("&label");
symbol1 value=none color=black i=join line=34;
symbol2 value=none color=black i=join line=1;
data annotate;
xsys="1"; ysys="1"; hsys="4"; x=50; y=90; position="5";
size=1; text="Stratum &stratum"; function="label";
proc gplot data=density anno=annotate;
where stratum=&stratum;
plot density*change=therapy/frame haxis=axis2 vaxis=axis1 nolegend;
run;
quit;
%mend PlotDist;
%PlotDist(1,);
%PlotDist(2,);
%PlotDist(3,Percent change in the frequency of incontinence episodes);

/* --- 0012-proc-freq.sas --- */
proc freq data=urininc;
ods select cmh;
table stratum*therapy*change/cmh2 scores=modridit;
run;
