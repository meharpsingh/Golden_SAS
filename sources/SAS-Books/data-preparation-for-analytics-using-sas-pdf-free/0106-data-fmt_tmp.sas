   DATA fmt_tmp;
    SET work.prop_%SCAN(&vars,&i)(RENAME=(%SCAN(&vars,&i) = start
&target=label)) END = last;;
 *WHERE _type_ = 1;
    RETAIN fmtname "%SCAN(&vars,&i)F" type "&type";
   RUN;
   *** Run PROC Format to create the format;
   PROC format library = &library CNTLIN = fmt_tmp;
   RUN;
%end;
*** Use the available Formats to create new variables;
options fmtsearch = (&library work sasuser);
DATA &out_ds;
 SET &data;
 FORMAT %DO i = 1 %TO &nvars;    %SCAN(&vars,&i)_m  %END; 16.3;
 %DO i = 1 %TO &nvars;
   %IF &type = c %THEN IF UPCASE(%SCAN(&vars,&i)) = 'OTHER' THEN
%SCAN(&vars,&i) = '_OTHER';;
   %SCAN(&vars,&i)_m =
INPUT(PUT(%SCAN(&vars,&i),%SCAN(&vars,&i)f.),16.3);
 %END;
RUN;
%mend;
