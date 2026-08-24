PROC LIFETEST DAta=my.recid;
  TIME week*arrest(0);
  STRATA wexp paro / ADJUST=TUKEY;
RUN;
