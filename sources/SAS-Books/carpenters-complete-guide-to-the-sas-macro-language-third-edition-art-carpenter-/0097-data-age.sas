data age;
   set sashelp.class(where=(name='Jane'));
   call symputx('jane_age',age);
   run;
%put &=jane_age;
