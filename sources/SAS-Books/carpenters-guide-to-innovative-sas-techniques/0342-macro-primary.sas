%macro primary;
  %local dsn; q
  %getdataname r
proc print data=&dsn s
  .... code not shown....
%mend primary;
%macro getdataname;
  .... code not shown....
  %let dsn = biomass; r
  .... code not shown....
%mend getdataname;
