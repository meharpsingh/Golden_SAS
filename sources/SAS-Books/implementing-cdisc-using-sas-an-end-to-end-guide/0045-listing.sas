    data &outdata;
       merge &outdata base2;
          by usubjid;
           %if &keepvars^= %then
             keep  &keepvars;
           ;
           chg  = aval - base;
           pchg = chg/base*100;
    run;
%mend cfb;
