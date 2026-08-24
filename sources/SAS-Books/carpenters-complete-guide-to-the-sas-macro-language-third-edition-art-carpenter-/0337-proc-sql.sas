proc sql noprint;
   select distinct clinnum ➏
      into :clinlist separated by ' ' ➐
         from macro3.clinics(keep=clinnum);
   %let clincnt=&sqlobs; ➑
   quit;
%put &=clincnt &=clinlist;
