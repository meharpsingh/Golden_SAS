data work.Extract(keep=Height);
set sashelp.heart(where=(Sex EQ 'Female' AND Height NE .));
run;
proc sql noprint;
select mean(Height),std(Height) into :Mean,:STD from work.Extract;
quit;
data work.FromPDF(keep=PDF_Y Height);
set work.Extract;
format PDF_Y best20.;
PDF_Y = pdf("Normal", Height, &Mean, &STD);
run;
proc sort
data=work.FromPDF
; by Height; run;
