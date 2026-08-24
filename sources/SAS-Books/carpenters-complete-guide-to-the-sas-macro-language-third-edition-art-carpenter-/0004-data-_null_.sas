data _null_;
   set sashelp.class(keep=name age
                     where=(name='Jane'));
   %let j_age = age;
   run;
