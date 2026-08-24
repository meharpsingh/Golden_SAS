%macro appnddsn(lib=DECNTRL);
%local i;
* ALLCONT will have one observation for each variable in
* each data set in the &LIB library;
proc contents data=&lib.._all_ ➐
              out=allcont(keep=memname
                          where=(memname=:'IN'))
              noprint;
run;
* Build the list of unique data sets;
proc sql noprint;
   select distinct memname ➑
      into :dsn1-
         from allcont;
