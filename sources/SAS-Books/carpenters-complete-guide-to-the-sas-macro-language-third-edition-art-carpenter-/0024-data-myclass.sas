data myclass;
   set sashelp.class;
   run;
%put &=syslast;
%put &=sysdsn;
