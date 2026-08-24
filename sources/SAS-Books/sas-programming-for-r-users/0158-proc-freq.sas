proc freq data=sp4r.cars;
     tables origin*type / chisq;
run;
