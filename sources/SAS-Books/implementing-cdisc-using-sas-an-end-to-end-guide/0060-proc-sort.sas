PROC SORT
  DATA = ADAM.ADEF
  OUT = ADEF;
    BY CRIT1 AVISITN;
RUN;
ODS SELECT CrossTabFreqs FishersExact;
PROC FREQ
  DATA = ADEF;
    BY CRIT1 AVISITN;
    WHERE ITTFL='Y';
    TABLES TRTPN * CRIT1FL / CHISQ;
  TITLE "Fishers Exact Test on Responder Rates Between Treatment Groups by
Visit";
RUN;
