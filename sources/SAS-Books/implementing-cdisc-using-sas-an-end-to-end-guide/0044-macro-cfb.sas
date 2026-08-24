%macro cfb(indata= ,outdata= ,avalvar= ,dayvar= ,keepvars= );
    proc sort
      data = &indata
      out = &outdata (rename = (&avalvar = aval));
        by usubjid visitnum;
    run;
    * Baseline is defined as the last non-missing value prior to study
      day 1 first dose;
    * (note, values on Day 1 are assumed to occur before the first dose);
    data base1 (keep = usubjid visitnum) base2 (keep = usubjid base);
      set &outdata;
        where &dayvar<=1 and aval > .z;
        by usubjid visitnum;
        rename aval = base;
        if last.usubjid;
    run;
    * Do one merge to identify the baseline record;
    data &outdata;
       merge &outdata base1 (in = inbase);
          by usubjid visitnum;
