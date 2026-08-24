PROC LIFEREG DATA=recid3;
   MODEL (lower,upper)=fin age race wexp mar paro prio
   / D=WEIBULL;
RUN;
