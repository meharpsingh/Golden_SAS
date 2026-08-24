  proc contents data= CLINICS;
    run;
  title2 "first 10 observations";
  proc print data= CLINICS (obs=10);
    run;
