%macro exeDat(Dat);
  %local mnam; %let mnam=&sysmacroname; %verbose(&mnam &Dat);
  * store #bins which are present on Dat;
  proc sql;
    select count(distinct binN) into :exeDatBinN from &Dat;
  quit;
  * in dpss we will keep all variables with ps, ipw, and overlap weights created by
    calls to PSs macro;
  data dpss;
    set &Dat;
    keep ordr;
  run;
       /**************************************************************;
