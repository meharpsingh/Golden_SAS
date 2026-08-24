proc fcmp outlib=macro3.functions.utilities;
   subroutine printN(lib $, dsn $,num);
      * This will NOT work! The macro is
      * executed when the function is compiled;
      %printit(lib,dsn,num)
   endsub;
   run;
