PROC LIFEREG DATA=quarter;
   CLASS j;
   MODEL time*event(0)=fin age race wexp mar paro prio j
         / D=EXPONENTIAL COVB;
RUN;
