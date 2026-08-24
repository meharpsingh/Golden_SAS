data &macdsn; ➊
   set sashelp.vmacro(where=(scope="%upcase(&scope)")); ➋
   run;
%mend globalsave;
%globalsave(scope=global,macdsn=macro3.GlobalMacroVars) ➌
%macro GlobalRetrieve(scope=global, macdsn=);
data _null_;
   set &macdsn(where=(scope="%upcase(&scope)")); ➍
   call symputx(name,value,'g'); ➎
   run;
%mend globalretrieve;
