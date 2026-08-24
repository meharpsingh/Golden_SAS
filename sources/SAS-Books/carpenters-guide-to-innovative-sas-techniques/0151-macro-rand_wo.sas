%macro rand_wo(dsn=,pcnt=0);
   * Randomly select observations from &DSN;
   data rand_wo(drop=cnt totl);
      * Calculate the number of obs to read;
      totl = ceil(&pcnt*obscnt); n
      array obsno {10000} _temporary_; o
      do until(cnt = totl);
         point = ceil(ranuni(0)*obscnt); p
         if obsno{point} ne 1 then do; q
            * This obs has not been selected before;
            set &dsn point=point nobs=obscnt; r
            output;
            obsno{point}=1; s
            cnt+1;
         end;
      end;
      stop; t
      run;
%mend rand_wo;
