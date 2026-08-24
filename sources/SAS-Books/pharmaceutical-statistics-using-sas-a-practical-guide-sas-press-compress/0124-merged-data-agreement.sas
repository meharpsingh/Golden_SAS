/* Merged listing: this program was assembled from 2 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0124-data-schiz.sas --- */
data schiz;
input rater_a $ rater_b $ num;
cards;
yes yes
yes no
no
yes
no
no
;
proc freq data=schiz;
weight num;
tables rater_a*rater_b;
exact agree;
run;

/* --- 0125-data-agreement.sas --- */
data agreement;
set schiz nobs=m;
format p_pos p_neg lower_p lower_n upper_p upper_n 5.3;
if rater_a='yes' and rater_b='yes' then d=num;
if rater_a='yes' and rater_b='no'
then c=num;
if rater_a='no'
and rater_b='yes' then b=num;
if rater_a='no'
and rater_b='no'
then a=num;
n=a+b+c+d;
p1=a/n; p2=b/n; p3=c/n; p4=d/n;
p_pos=2*d/(2*d+b+c);
p_neg=2*a/(2*a+b+c);
phi1=(2/(2*p4+p2+p3))-(4*p4/((2*p4+p2+p3)**2));
phi2_3=-2*p4/(((2*p4+p2+p3)**2));
gam2_3=-2*p1/(((2*p1+p2+p3)**2));
gam4=(2/(2*p1+p2+p3))-(4*p1/((2*p1+p2+p3)**2));
sum1=(phi1*p4+phi2_3*(p2+p3))**2;
sum2=(gam4*p1+gam2_3*(p2+p3))**2;
var_pos=(1/n)*(p4*phi1*phi1+(p2+p3)*phi2_3*phi2_3-4*sum1);
var_neg=(1/n)*(p1*gam4*gam4+(p2+p3)*gam2_3*gam2_3-4*sum2);
lower_p=p_pos-1.96*sqrt(var_pos);
lower_n=p_neg-1.96*sqrt(var_neg);
upper_p=p_pos+1.96*sqrt(var_pos);
upper_n=p_neg+1.96*sqrt(var_neg);
retain a b c d;
label p_pos='Proportion of positive agreement'
p_neg='Proportion of negative agreement'
lower_p='Lower 95% confidence limit'
lower_n='Lower 95% confidence limit'
upper_p='Upper 95% confidence limit'
upper_n='Upper 95% confidence limit';
if _n_=m;
