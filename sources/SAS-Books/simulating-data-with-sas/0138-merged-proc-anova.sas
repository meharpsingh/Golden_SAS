/* Merged listing: this program was assembled from 2 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0138-data-anovadata.sas --- */
data AnovaData(keep=Treatment Y);
call streaminit(1);
grandmean = 20;
array effect{6} _temporary_ (9 -6 -6 4 0 0);
array std{6}
_temporary_ (6
4 4 1 2);
do i = 1 to dim(effect);
/* number of treatment levels
*/
Treatment = i;
do j = 1 to 5;
/* number of obs per treatment level */
Y = grandmean + effect{i} + rand("Normal", 0, std{i});
output;
end;
end;
run;

/* --- 0139-proc-anova.sas --- */
proc ANOVA data=AnovaData;
class Treatment;
model Y = Treatment;
ods exclude ClassLevels NObs;
run;
