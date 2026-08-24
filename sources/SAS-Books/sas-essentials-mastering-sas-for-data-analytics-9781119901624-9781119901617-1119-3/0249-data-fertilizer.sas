  DATA FERTILIZER;
  INPUT BRAND $ HEIGHT;
  DATALINES;
  A   20.00
  A   23.00
  A   32.00
  A   24.00
  A   25.00
  A   28.00
  A   27.50
  B   25.00
  B   46.00
  B   56.00
  B   45.00
  B   46.00
  B   51.00
  B   34.00
  B   47.50
  ;
  PROC NPAR1WAY WILCOXON;
       CLASS BRAND;
       VAR HEIGHT;
         EXACT;
      Title 'Compare two groups using NPAR1WAY';
  RUN;
