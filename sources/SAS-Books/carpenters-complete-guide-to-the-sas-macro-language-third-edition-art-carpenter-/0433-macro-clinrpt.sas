%macro clinrpt(loc=,dir=);
   ods escapechar='~'; ➊
   proc sort data=macro3.clinics
             out=clinics
             nodupkey;
      by region clinname;
      run;
   data _null_;
      set clinics end=eof;
      by region;
      if first.region then do;
