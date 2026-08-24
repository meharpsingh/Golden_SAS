proc sort data=macro3.clinics(keep=clinnum)
          out=clincodes
          nodupkey; ➊
   by clinnum;
   run;
data _null_; ➋
   set clincodes end=eof; ➌
   call symputx(catt('clin',_n_),clinnum); ➍
   if eof then call symputx('clincnt',_n_); ➎
   run;
%put _user_;
