/* Merged listing: this program was assembled from 3 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0179-data-work-forcomparison.sas --- */
data work.ForComparison;
X=1; Y=1; Response=2; output;
X=2; Y=1; Response=1; output;
run;

/* --- 0180-proc-sgplot.sas --- */
ods listing gpath="C:\temp" dpi=300 style=GraphFontArial11ptBold;
ods graphics / reset=all scale=off width=2.8in height=1.3in
  imagename="Fig7-9Left_LINEAR";
title1 '"LINEAR" Default';
title2 color=red "2 is over-represented versus 1";
proc sgplot data=work.ForComparison noborder;
bubble x=X y=Y size=Response / datalabel=Response
  datalabelattrs=(color=red)
  datalabelpos=bottom
  /* omit PROPORTIONAL as only way to access default alternative */
  fillattrs=(color=red);
xaxis display=none values=(0 1 2 3); yaxis display=none;
run;

/* --- 0181-proc-sgplot.sas --- */
proc sgplot data=work.ForComparison noborder;
bubble x=X y=Y size=Response / datalabel=Response
  datalabelattrs=(color=white)
  datalabelpos=center
PROPORTIONAL /* as recommended */
  fillattrs=(color=blue);
xaxis display=none values=(0 1 2 3); yaxis display=none;
run;
