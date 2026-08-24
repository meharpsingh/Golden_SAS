  DATA TIME;
  INPUT SUBJ DRUG OBS;
  DATALINES;
  1   1   31
  1   2   29
  1   3   17
  1   4   35
  2   1   15
  ... ETC ...
  5   2   27
  5   3   15
  5   4   31
  ;
  Title "Friedman Analysis";
  PROC FREQ;
    TABLES SUBJ*DRUG*OBS / CMH2 SCORES=RANK NOPRINT;
  RUN;
