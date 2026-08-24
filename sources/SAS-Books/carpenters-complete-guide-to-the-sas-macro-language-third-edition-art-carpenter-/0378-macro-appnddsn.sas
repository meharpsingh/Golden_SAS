%macro appnddsn(lib=DECNTRL);
%local i;
* Determine the data sets, make a macro var for each;
* use data set of the form &lib..INxxxxxx ;
proc sql noprint;
   select memname
      into :dsn1-
         from dictionary.tables ➏
            where libname="%upcase(&lib)" &
                  substr(memname,1,2)='IN';
   %let dsncnt=&sqlobs;
   quit;
