PROC LIFETEST DATA=recid;
   TIME week*arrest(0);
   TEST fin age race wexp mar paro prio;
RUN;
