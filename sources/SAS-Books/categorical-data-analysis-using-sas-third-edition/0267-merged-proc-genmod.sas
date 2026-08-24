/* Merged listing: this program was assembled from 4 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0267-data-skincross.sas --- */
data skincross;
input subject gender $ sequence $ Time1 $ Time2 $ @@;
datalines;
m AB
Y
Y
101 m
PA
Y
Y
201 f
AP
Y
Y
m AB
Y
.
102 m
PA
Y
Y
202 f
AP
Y
Y
m AB
Y
Y
103 m
PA
Y
Y
203 f
AP
Y
Y
m AB
Y
.
104 m
PA
Y
Y
204 f
AP
Y
Y
m AB
Y
Y
105 m
PA
Y
Y
205 f
AP
Y
Y
m AB
Y
.
106 m
PA
Y
N
206 f
AP
Y
Y
m AB
Y
.
107 m
PA
Y
.
207 f
AP
Y
Y
m AB
Y
Y
108 m
PA
Y
N
208 f
AP
Y
Y
m AB
Y
Y
109 m
PA
N
.
209 f
AP
Y
Y
m AB
Y
Y
110 m
PA
N
Y
210 f
AP
Y
Y
m AB
Y
.
111 m
PA
N
Y
211 f
AP
Y
Y
m AB
Y
Y
112 m
PA
N
Y
212 f
AP
Y
Y
m AB
Y
N
113 m
PA
N
.
213 f
AP
Y
Y
m AB
Y
N
114 m
PA
N
.
214 f
AP
Y
.
m AB
Y
N
115 m
PA
N
Y
215 f
AP
Y
.
m AB
Y
N
116 m
PA
N
Y
216 f
AP
Y
.
m AB
Y
N
117 m
PA
N
Y
217 f
AP
Y
Y
m AB
Y
N
118 m
PA
N
Y
218 f
AP
Y
Y
m AB
Y
.
119 m
PA
N
Y
219 f
AP
Y
Y
m AB
Y
N
120 m
PA
N
Y
220 f
AP
Y
Y
m AB
Y
N
121 m
PA
N
Y
221 f
AP
Y
.
m AB
Y
N
122 m
PA
N
Y
222 f
AP
Y
Y
m AB
Y
.
123 m
PA
N
Y
223 f
AP
Y
Y
m AB
Y
N
124 m
PA
N
Y
224 f
AP
Y
Y
;

/* --- 0268-data-skincross2.sas --- */
data skincross2;
set skincross;
period=1;
treatment=substr(sequence, 1, 1);
carry='N';
response=Time1;
output;
period=2;
Treatment=substr(sequence, 2, 1);
carry = substr(sequence, 1, 1);
if carry='P' then carry='N';
response=Time2;
output;
run;

/* --- 0269-proc-genmod.sas --- */
proc genmod data=skincross2 descending;
class subject treatment period gender carry;
model response = treatment period gender carry
gender*period /type3
dist=bin link=logit;
repeated subject=subject / type=exch;
run;

/* --- 0270-proc-genmod.sas --- */
proc genmod data=skincross2 descending;
class subject treatment period gender;
model response = treatment period gender gender*period
/type3
dist=bin link=logit;
repeated subject=subject / type=exch;
estimate 'OR:A-B' treatment 1 -1 0 /exp;
estimate 'OR:A-P' treatment 1 0 -1 / exp;
estimate 'OR:B-P' treatment 0 1 -1 / exp;
run;
