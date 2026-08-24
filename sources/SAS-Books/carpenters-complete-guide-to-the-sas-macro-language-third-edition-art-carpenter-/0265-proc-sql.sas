proc sql noprint;
   select distinct name
      into :maclist separated by ' '
         from dictionary.macros
            where upcase(SCOPE) eq 'GLOBAL'
                and name ne 'maclist'
/*                and name ne 'SYS_SQL_IP_ALL'*/
/*                and name ne 'SYS_SQL_IP_STMT'*/
    ;
   quit;
%put &=maclist;
%symdel &maclist maclist;
%put _global_;
