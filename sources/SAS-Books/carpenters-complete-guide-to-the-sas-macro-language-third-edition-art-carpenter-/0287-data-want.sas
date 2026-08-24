data want;
   set sashelp.class(where=(name>'B'));
   run;
%put &=sysnobs;
