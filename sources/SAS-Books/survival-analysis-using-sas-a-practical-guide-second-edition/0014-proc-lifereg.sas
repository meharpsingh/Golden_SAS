PROC LIFEREG DATA=recid;
   CLASS educ;
   MODEL week*arrest(0)=fin age race wexp mar paro
         prio educ / D=WEIBULL;
RUN;
