proc print data=sashelp.vcatalg
             (where=(libname='WORK' & memname='SASMACR'));
   var libname memname objname objdesc;
   run;
