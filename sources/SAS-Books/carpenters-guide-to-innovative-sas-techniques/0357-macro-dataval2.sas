%macro dataval2;
* Determine list of data sets to check;
proc sql noprint;
  select dsn,keyvars
   into :dsn1-:dsn999,
      :keyvars1-:keyvars999
   from advrpt.dsncontrol;
  %let dsncnt=&sqlobs;
  quit;
%* Perform data validation checks;
%* on each data set;
%do i = 1 %to &dsncnt;
  %errrpt(dsn=&&dsn&i, bylst=&&keyvars&i)
%end;
%mend dataval2;
