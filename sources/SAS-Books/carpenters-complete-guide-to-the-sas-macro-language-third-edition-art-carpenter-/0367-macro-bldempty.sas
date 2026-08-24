%macro bldempty;
%* Create lists;
proc sql noprint; ➊
   select dsn
      into :dsn1-
         from macro3.dbdir;
   %let dsncnt=&sqlobs;
   select dsn, var, vartype, label
      into :vdsn1-,
           :vvar1-,
           :vtyp1-,
           :vlbl1-
         from macro3.vardir;
   %let varcnt = &sqlobs;
   quit;
%do jj = 1 %to &dsncnt; ➋
   %* One data step for each data set;
   %* The JJ loop steps through the data sets;
   data &&dsn&jj(keep=  ➌
    %* Build the var list to keep for this DB;
    %* The KK loop steps through the variables list;
    %do kk = 1 %to &varcnt; ➍
      %* include the ALL variables in every data set;
      %if &&dsn&jj=&&vdsn&kk or &&vdsn&kk=ALL ➎
              %then &&vvar&kk; ➏
    %end;
      );
    * Use length to define variable attributes;
    length
      %do kk = 1 %to &varcnt;
         %if &&dsn&jj=&&vdsn&kk or &&vdsn&kk=ALL
              %then &&vvar&kk &&vtyp&kk; ➐
      %end;
      ;
    * Define the variable labels;
    label
      %do kk = 1 %to &varcnt;
         %if &&dsn&jj=&&vdsn&kk or &&vdsn&kk=ALL
                    %then &&vvar&kk = "&&vlbl&kk"; ➑
      %end;
      ;
    stop; ➒
    run;
%end;
%mend bldempty;
