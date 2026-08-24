%macro qCharVar(lib=,dsn=);
   %local qlist;
   proc sql noprint;
   select quote(trim(name)) ➐
      into :qlist separated by "," ➑
         from dictionary.columns
            where libname="%upcase(&lib)"
                & memname="%upcase(&dsn)"
                & type='char'; ➒
   quit;
   %* Usage of the quoted list would go here.;
   %put |&qlist|; ➓
%mend qcharvar;
