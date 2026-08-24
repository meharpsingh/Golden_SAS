/* Merged listing: this program was assembled from 3 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0045-data-fev1.sas --- */
data fev1;
input time n1 mean1 sd1 n2 mean2 sd2;
datalines;
0.25 10 0.58
0.29 10 0.71 0.35
0.5
10 0.62
0.31 10 0.88 0.33
0.75 10 0.51
0.33 10 0.73 0.36
10 0.34
0.27 10 0.68 0.29
10 -0.06 0.22 10 0.37 0.25
10 0.05
0.23 10 0.43 0.28
;
data summary;
set fev1;
meandif=mean2-mean1;
se=sqrt((1/n1+1/n2)*(sd1*sd1+sd2*sd2)/2);
t=meandif/se;
p=1-probt(t,n1+n2-2);
lower=meandif-tinv(0.95,n1+n2-2)*se;
axis1 minor=none label=(angle=90 "Treatment difference (L)")
order=(-0.2 to 0.5 by 0.1);
axis2 minor=none label=("Time (hours)") order=(0 to 3 by 1);
symbol1 value=none i=j color=black line=1;
symbol2 value=none i=j color=black line=20;
proc gplot data=summary;
plot meandif*time lower*time/overlay frame vaxis=axis1 haxis=axis2
vref=0 lvref=34;
run;
axis1 minor=none label=(angle=90 "Raw p-value") order=(0 to 0.2 by 0.05);
axis2 minor=none label=("Time (hours)") order=(0 to 3 by 1);
symbol1 value=dot i=j color=black line=1;
proc gplot data=summary;
plot p*time/frame vaxis=axis1 haxis=axis2 vref=0.05 lvref=34;
run;

/* --- 0046-proc-sort.sas --- */
proc sort data=summary;
by descending time;
data rejcount;
set summary nobs=m;
retain index 1 minlower 100;
if lower>0 and index=_n_ then index=_n_+1;
if lower<minlower then minlower=lower;
keep index minlower;
if _n_=m;
data adjci;
set summary nobs=m;
if _n_=1 then set rejcount;
if index=m+1 then adjlower=minlower;
if index<=m and _n_<=index then adjlower=min(lower,0);
axis1 minor=none label=(angle=90 "Treatment difference (L)")
order=(-0.2 to 0.5 by 0.1);
axis2 minor=none label=("Time (hours)") order=(0 to 3 by 1);
symbol1 value=none i=j color=black line=1;
symbol2 value=none i=j color=black line=20;
proc gplot data=adjci;
plot meandif*time lower*time/overlay frame vaxis=axis1 haxis=axis2
vref=0 lvref=34;
run;

/* --- 0047-proc-gplot.sas --- */
proc gplot data=adjci;
plot meandif*time adjlower*time/overlay frame vaxis=axis1 haxis=axis2
vref=0 lvref=34;
run;
