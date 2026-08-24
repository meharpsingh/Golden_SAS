%macro varlist(dsn=sashelp.class, type=1);
%* TYPE 1=numeric
%*      2=character;
%local varlist;
proc contents data=&dsn
              out=cont(keep=name type n
                       where=(type=&type))
              noprint;
  run;
