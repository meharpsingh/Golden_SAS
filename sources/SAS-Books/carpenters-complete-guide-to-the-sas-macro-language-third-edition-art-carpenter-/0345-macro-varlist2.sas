%macro varlist2(lib=,dsn=);
%local i;
* Collect the variable names;
proc sql noprint;
select distinct name into :varname1- ➊
   from dictionary.columns ➋
      where (libname=upcase("&lib") &  ➌
memname=upcase("&DSN"));
quit;
