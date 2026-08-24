 ODS GRAPHICS OFF;
for this example to work because it applies to standard SAS graphs,
and not ODS graphs. The example code (APXA_PATTERN2.SAS) is
shown here.
  GOPTIONS RESET = ALL;
 DATA BARS;
 INPUT A B;
 DATALINES;
 1 1
 2 2
 3 3
 4 4
 5 5
 ;
 PATTERN1 V=E C=BLUE;
 PATTERN2 V=R1 C=BLACK;
 PATTERN3 V=X2 C=BLACK;
 PATTERN4 V=L3 C=BLACK;
 PATTERN5 V=S C=BLACK;
 PROC GCHART ;VBAR A
 /DISCRETE WIDTH=10
 SUBGROUP=B;
 RUN;
 QUIT;
