%macro restoreMvars
      (lib=save,
       data=savedMacroVars
      );
 %if %sysfunc(exist(&lib..&data)) gt 0 %then
 %do;  /* restore only if data set exists */   n
    data _null_;
     set &lib..&data;
     /* must be added to the global environment for the request executive */
     call execute('%global '||trim(name)||';'); o
     /* only provide value from saved session if not already defined */
     if symget(name) = ' ' then call symput(name,trim(value)); p
    run;
 %end; /* restore only if data set exists */
%mend restoreMvars;
