%macro saveMvars
     (lib=save,
      data=savedMacroVars,
      saveFlag=,
      includeAuto=
     );
 %if %sysfunc(libref(&lib)) = 0 and n
     %length(&saveFlag) ne 0 %then
 %do;  /* save is available only for sessions that are not lightweight
          sessions */
    data &lib..&data;
     set sashelp.vmacro(keep=scope name value offset); o
     where scope = 'GLOBAL'
           and offset=0
           %if %length(&includeAuto) = 0 %then and substr(name,1,1) ne '_';
           and name ne: 'SYS';
     drop scope offset;
    run;
 %end; /* save is available only for sessions that are not lightweight
          sessions */
%mend saveMvars;
