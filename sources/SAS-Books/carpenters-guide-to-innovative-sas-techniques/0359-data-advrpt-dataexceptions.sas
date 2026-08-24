data advrpt.DataExceptions;
  length dsn $12 exception $35;
  dsn='AE';     exception="(subject le '204')"; output;
  dsn='conmed'; exception="(subject ne '202')"; output;
  dsn='conmed'; exception="(subject ne '208')"; output;
  run;
%macro exceptions;
where=(subject ne '202') o
%mend exceptions;
data conmed;
  set advrpt.conmed(%exceptions p);
 run;
%macro exceptions(dsn=ae);
  * Build exception list;
  proc sql noprint;
   select exception into :explist separated by '&' s
     from advrpt.dataexceptions q
      where upcase(dsn)=upcase("&dsn"); r
   quit;
  %if &explist ne %then %let explist=where=(&explist); t
%mend exceptions;
%let explist = ; u
%exceptions(dsn=conmed) v
%put &explist;
proc print data=advrpt.conmed(&explist) w;
  run;
