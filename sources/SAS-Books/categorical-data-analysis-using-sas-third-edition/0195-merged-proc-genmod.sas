/* Merged listing: this program was assembled from 4 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0195-data-lri.sas --- */
data lri;
input id count risk passive crowding ses agegroup race @@;
logrisk =log(risk/52);
datalines;
1 0 42 1 0 2 2 0 96 1 41 1 0 1 2 0
191 0 44 1 0 0 2 0
2 0 43 1 0 0 2 0 97 1 26 1 1 2 2 0
192 0 45 0 0 0 2 1
3 0 41 1 0 1 2 0 98 0 36 0 0 0 2 0
193 0 42 0 0 0 2 0
4 1 36 0 1 0 2 0 99 0 34 0 0 0 2 0
194 1 31 0 0 0 2 1
5 1 31 0 0 0 2 0 100 1
3 1 1 2 3 1
195 0 35 0 0 0 2 0
6 0 43 1 0 0 2 0 101 0 45 1 0 0 2 0
196 1 35 1 0 0 2 0
7 0 45 0 0 0 2 0 102 0 38 0 0 1 2 0
197 1 27 1 0 1 2 0
8 0 42 0 0 0 2 1 103 0 41 1 1 1 2 1
198 1 33 0 0 0 2 0
9 0 45 0 0 0 2 1 104 1 37 0 1 0 2 0
199 0 39 1 0 1 2 0
10 0 35 1 1 0 2 0 105 0 40 0 0 0 2 0
200 3 40 0 1 2 2 0
11 0 43 0 0 0 2 0 106 1 35 1 0 0 2 0
201 4 26 1 0 1 2 0
12 2 38 0 0 0 2 0 107 0 28 0 1 2 2 0
202 0 14 1 1 1 1 1
13 0 41 0 0 0 2 0 108 3 33 0 1 2 2 0
203 0 39 0 1 1 2 0
14 0 12 1 1 0 1 0 109 0 38 0 0 0 2 0
204 0
4 1 1 1 3 0
... more lines ...
90 1 38 1 1 1 2 1 185 0 43 0 0 0 2 0
280 0 31 0 0 0 2 0
91 0 32 1 1 1 2 0 186 0 42 0 0 0 2 0
281 0 18 0 0 0 2 0
92 1
3 1 0 1 3 1 187 0 42 0 0 0 2 0
282 1 32 1 0 2 2 0
93 0 26 1 0 0 2 1 188 0 38 0 0 0 2 0
283 0 22 1 1 2 2 1
94 0 35 1 0 0 2 0 189 0 36 1 0 0 2 0
284 0 35 0 0 0 2 1
95 3 37 1 0 0 2 0 190 0 39 0 1 0 2 0
;

/* --- 0196-proc-genmod.sas --- */
proc genmod data=lri;
class ses race agegroup / param=ref;
model count = passive crowding ses race agegroup /
dist=poisson offset=logrisk type3;
run;

/* --- 0197-proc-genmod.sas --- */
proc genmod data=lri;
class ses race agegroup / param=ref;
model count = passive crowding ses race agegroup /
dist=poisson offset=logrisk type3 scale=pearson;
run;

/* --- 0198-proc-genmod.sas --- */
proc genmod data=lri;
class ses id race agegroup / param=ref;
model count = passive crowding ses race agegroup /
dist=nb offset=logrisk type3;
run;
