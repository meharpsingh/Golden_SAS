/* Merged listing: this program was assembled from 7 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0179-data-engine.sas --- */
data engine;
   input speed power @@;
   speedsq=speed*speed;
   datalines;
22.0 64.03 20.0 62.47 18.0 54.94 16.0 48.84 14.0 43.73
12.0 37.48 15.0 46.85 17.0 51.17 19.0 58.00 21.0 63.21
22.0 64.03 20.0 59.63 18.0 52.90 16.0 48.84 14.0 42.74
12.0 36.63 10.5 32.05 13.0 39.68 15.0 45.79 17.0 51.17
19.0 56.65 21.0 62.61 23.0 65.31 24.0 63.89
;
run;
ods graphics on;
ods select ScatterPlot;
proc corr data=engine plots=scatter(noinset ellipse=none);
   var speed power;
   title 'Scatterplot for ENGINE Data';
run;
ods graphics off;
proc reg data=engine;
   id speed;
   model power=speed speedsq / p cli clm;
title 'Fitting a Curve to the ENGINE Data';
run;
quit;
ods select OutputStatistics;
proc reg data=engine alpha=0.10;
   model power=speed speedsq / p cli clm;
title '90% Limits for ENGINE Data';
run;
quit;
title;
ods graphics on;
ods select PredictionPlot;
proc reg data=engine alpha=0.10 plots(only)=predictions(x=speed
unpack);
   model power=speed speedsq ;
run;
quit;

/* --- 0191-proc-reg.sas --- */
ods graphics on;
proc reg data=engine
         plots(only)=(residuals residualbypredicted);
    model power=speed;
run;
   plot r.*obs. / nostat  nomodel;
run;
quit;

/* --- 0192-proc-reg.sas --- */
ods graphics on;
proc reg data=engine
         plots(only)=(residuals(unpack) residualbypredicted);
   model power=speed speedsq;
run;
   plot r.*obs. / nostat  nomodel;
quit;

/* --- 0193-proc-reg.sas --- */
proc reg data=engine;
   model power=speed speedsq / r;
   plot student.*obs. / vref=-2 2 cvref=red nostat;
run;
quit;

/* --- 0197-proc-reg.sas --- */
proc reg data=engine;
   model power=speed / lackfit;
run;

/* --- 0198-proc-reg.sas --- */
proc reg data=engine;
   model power=speed speedsq / lackfit;
run;

/* --- 0200-proc-reg.sas --- */
ods graphics on;
proc reg data=engine
     plots(only)=(residualhistogram residualboxplot qqplot);
   model power=speed speedsq;
run;
quit;
