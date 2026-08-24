%macro appnddsn(lib=DECNTRL);
%local filrf rc did memcount i dsn;
* Determine the data set names of the form &lib..INxxxxxx ;
%let filrf=mydata; ➊
%let rc=%sysfunc(filename(filrf, %sysfunc(pathname(&lib)))); ➋
%let did=%sysfunc(dopen(&filrf)); ➌
%let memcount=%sysfunc(dnum(&did)); ➍
%if &memcount > 0 %then %do;
   proc datasets library=work nolist;
      delete alldsn;
      %* Append the data sets;
      %do i = 1 %to &memcount; ➎
         %let dsn=%sysfunc(dread(&did, &i)); ➏
         %if %upcase(%substr(&dsn,1,2))=IN
              and %scan(&dsn,2,.)=sas7bdat %then %do; ➐
            append base=alldsn data=&lib..%scan(&dsn,1,.);
         %end;
      %end;
      quit;
%end;
%let rc=%sysfunc(dclose(&did)); ➑
%let rc=%sysfunc(filename(filrf)); ➒
%mend appnddsn;
