/* Merged listing: this program was assembled from 5 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0137-data-bullets.sas --- */
data bullets;
   input powder $ velocity @@;
   datalines;
BLASTO 27.3 BLASTO 28.1 BLASTO 27.4 BLASTO 27.7
BLASTO 28.0 BLASTO 28.1 BLASTO 27.4 BLASTO 27.1
ZOOM 28.3 ZOOM 27.9 ZOOM 28.1 ZOOM 28.3 ZOOM 27.9
ZOOM 27.6 ZOOM 28.5 ZOOM 27.9 KINGPOW 28.4 KINGPOW 28.9 KINGPOW
28.3 KINGPOW 27.9 KINGPOW 28.2 KINGPOW 28.9
KINGPOW 28.8 KINGPOW 27.7
;
run;

/* --- 0138-proc-means.sas --- */
proc means data=bullets;
   class powder;
   var velocity;
title 'Brief Summary of Bullets Data';
run;
proc boxplot data=bullets;
   plot velocity*powder / boxwidthscale=1 bwslegend;
title 'Comparative Box Plots by Gunpowder';
run;

/* --- 0139-proc-anova.sas --- */
ods select HOVFTest;
proc anova data=bullets;
   class powder;
   model velocity=powder;
   means powder / hovtest;

/* --- 0140-proc-univariate.sas --- */
ods select TestsForNormality;
proc univariate data=bullets normal;
   class powder;
   var velocity;
title 'Testing Normality for Bullets Data';
run;

/* --- 0141-proc-anova.sas --- */
proc anova data=bullets;
   class powder;
   model velocity=powder;
   means powder / hovtest;
title 'ANOVA for Bullets Data';
run;
quit;
proc npar1way data=bullets wilcoxon;
   class powder;
   var velocity;
title 'Nonparametric Tests for Bullets Data';
run;
