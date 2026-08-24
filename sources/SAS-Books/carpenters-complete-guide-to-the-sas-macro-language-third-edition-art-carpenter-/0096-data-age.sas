data age;
   set sashelp.class(where=(name='Jane'));
   %let jane_age = age;
   run;
%put &=jane_age;
