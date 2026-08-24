DATA newrecid;
   SET recid;
   IF arrest=0 THEN week=53;
PROC LIFETEST DATA=newrecid METHOD=LIFE PLOTS=(S,H)
   INTERVALS=10 20 30 40 50 53;
   TIME week*arrest(0);
RUN;
