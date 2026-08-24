proc fcmp outlib=macro3.functions.utilities;
   subroutine printN(lib $, dsn $,num);
      rc=run_macro('printit',lib,dsn,num);
   endsub;
   run;
