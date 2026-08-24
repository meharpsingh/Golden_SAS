proc sql noprint;
   select dsn
      into :dsn1 - ➊
         from macro3.dbdir;
   %let dsncnt = &sqlobs; ➋
   quit;
