%macro printall;
  %local i dsncount;
  * Build lists of macro vars;
  proc sql noprint;
  select dsn,keyvars,critvars n
   into :dsn1 - :dsn999, o
      :keyvar1 - :keyvar999,
      :critvar1 - :critvar999
     from advrpt.dsncontrol; p
  %let dsncount = &sqlobs; q
  %do i = 1 %to &dsncount; r
   title2 "Critical Variables for &&dsn&i";
   proc print data=advrpt.&&dsn&i;
     id &&keyvar&i; s
     var &&critvar&i;
     run;
  %end;
%mend printall;
