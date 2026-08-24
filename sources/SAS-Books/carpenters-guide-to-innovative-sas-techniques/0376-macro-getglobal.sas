%macro GetGlobal;
data _null_;
   set advrpt.globalvars(where=(name ne 'PATH'));
   call symputx(name,value,'g');
   run;
%mend getGlobal;
