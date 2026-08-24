%macro copyall(inlib=, outlib=);
proc datasets memtype=data;
   copy in=&inlib out=&outlib;
   quit;
%if &syserr>5 %then %do;
   %put ERROR: &=syserrortext; ➊
   %put ERROR: &=syserr; ➋
   %abort;
%end;
%put Copy was successful;
