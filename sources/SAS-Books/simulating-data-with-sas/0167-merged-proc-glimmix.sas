/* Merged listing: this program was assembled from 2 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0167-data-heights.sas --- */
data heights;
input Family Gender$ Height @@;
datalines;
1 F 67
1 F 66
1 F 64
1 M 71
1 M 72
2 F 63
2 F 63
2 F 67
2 M 69
2 M 68
2 M 70
3 F 63
3 M 64
4 F 67
4 F 66
4 M 67
4 M 67
4 M 69
;
run;
/* Model data. Save parameter estimates */
proc mixed data=heights;
class Family Gender;
model Height = Gender / solution outpm=outpm;
random Family Family*Gender;
ods select CovParms SolutionF;
ods output CovParms=CovParms SolutionF=SolutionF;
run;

/* --- 0168-proc-glimmix.sas --- */
proc glimmix data=heights outdesign(names novar)=All;
class Family Gender;
model Height = Gender;
random Family Family*Gender;
ods select ColumnNames;
run;
