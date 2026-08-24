data work.IBM1998Close;
retain MaxClose 0;
set sashelp.Stocks end=LastOne;
where year(Date) EQ 1998 and Stock EQ 'IBM';
MaxClose = max(MaxClose,Close);
Output;
if LastOne;
call symput('MaxClose',MaxClose);
call
symput('MaxCloseDisplay',trim(left(put(MaxClose,6.2))));
call symput('MaxCloseRoundedUp',ceil(MaxClose));
          /* round up to next integer */
run;
/* The above DATA step code is stored in C:\SharedCode as
   IBM1998CloseAndMaxCloseMacroVariable.sas;
