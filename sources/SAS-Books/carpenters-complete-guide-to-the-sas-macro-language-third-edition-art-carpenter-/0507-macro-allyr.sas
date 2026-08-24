%macro allyr(start=04,stop=05); ➊
/*   %* assume a two digit yearcutoff of 1920; */
/*   %*     (1920 is the default for SAS9.3) */
/*   %*     (1926 is the default for SAS9.4)*/
/*   %if &start <= 20 %then %let first = 2000 + &start;*/ ➋
/*   %else %let first = 1900 + &start;*/
/*   %if &stop <= 20 %then %let last = 2000 + &stop;*/
/*   %else %let last = 1900 + &stop;*/
   %local first last year yr;
   %* Use the current setting of the YEARCUTOFF option;
   %let first = %sysfunc(year(%sysfunc(mdy(1,1,&start)))); ➌
   %let last  = %sysfunc(year(%sysfunc(mdy(1,1,&stop))));
   %do year = &first %to &last; ➍
      %* Create a two digit year;
      %let yr = %sysfunc(mod(&year,100),z2.); ➎
/*      %* Test values;*/
/*      %put &=first &=last &=year &=yr;*/ ➏
      data temp;
         set yr&yr; ➐
         year = &year; ➑
         run;
      proc datasets lib=work nolist;
         append base=allyear data=temp;
         quit;
     %end;
