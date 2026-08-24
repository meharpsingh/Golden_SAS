proc sort
  data=adsl
  (keep = &ADSLKEEPSTRING)
  out=adam.adsl;
    by &ADSLSORTSTRING;
run;
