%macro prtclass(dset=sashelp.class,
                classvar=sex,
                prtcnt=10,
                tst=on);
   %local classlist classcnt j put;
   proc sql noprint;
      select unique &classvar
         into :classlist separated by '|' ➍
            from &dset;
   %let classcnt = &sqlobs;
   quit;
   %if %upcase(&tst)=ON %then %let put=%nrstr(%put ); ➎
   %else %let put=;
   %do j = 1 %to &classcnt; ➏
      %unquote( ➐
      &put title1 "First &prtcnt obs of &classvar =
                                 %qscan(&classlist,&j,|)";
      &put proc print data=&dset(obs=&prtcnt);
