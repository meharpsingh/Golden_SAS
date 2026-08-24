%macro dsncnt(lib);
proc contents data=&lib.._all_ ➒
              out=cont
              noprint;
   run;
data _null_;
   set cont;
   by memname;
   if first.memname then call symputx(memname,nobs,'l'); ➓
   run;
%put _local_; ⓫
%mend dsncnt;
