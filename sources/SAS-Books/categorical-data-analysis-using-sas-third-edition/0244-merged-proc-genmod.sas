/* Merged listing: this program was assembled from 6 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0244-data-cross.sas --- */
data cross (drop=count);
input age $ sequence $ time1 $ time2 $ count;
do i=1 to count;
output;
end;
datalines;
;

/* --- 0245-data-cross2.sas --- */
data cross2;
set cross;
subject=_n_;
period=1;
drug = substr(sequence, 1, 1);
carry='N';
response = time1;
output;
period=0;
drug
= substr(sequence, 2, 1);
carry = substr(sequence, 1, 1);
if carry='P' then carry='N';
response = time2;
output;
;
proc print data=cross2(obs=15);
run;

/* --- 0246-proc-genmod.sas --- */
proc genmod data=cross2;
class subject age drug carry;
model response = period age drug
period*age carry
drug*age / dist=bin type3;
repeated subject=subject/type=unstr;
run;

/* --- 0247-proc-genmod.sas --- */
ods select Contrasts;
proc genmod data=cross2;
class subject age drug carry;
model response = period age drug
period*age carry
drug*age / dist=bin type3;
repeated subject=subject/type=unstr;
contrast 'carry' carry 1 0 -1,
carry 0 1 -1;
contrast 'inter' age*drug 1 0 -1 -1 0
1 ,
age*drug 0 1 -1
0 -1 1 ;
contrast 'joint' carry 1 0 -1,
carry 0 1 -1,
age*drug 1 0 -1 -1 0
1 ,
age*drug 0 1 -1
0 -1 1 ;
run;

/* --- 0248-proc-genmod.sas --- */
proc genmod data=cross2;
class subject age drug;
model response = period age drug
period*age
/ dist=bin type3;
repeated subject=subject/type=unstr corrw;
run;

/* --- 0249-proc-genmod.sas --- */
ods select Contrasts;
proc genmod data=cross2;
class subject age drug;
model response = period age drug
period*age
/ dist=bin type3;
repeated subject=subject/type=unstr;
contrast 'A versus B' drug 1 -1 0;
run;
