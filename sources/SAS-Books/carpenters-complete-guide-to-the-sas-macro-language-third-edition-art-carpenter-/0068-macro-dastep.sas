%macro dastep(state=AZ);
data subhosp;
    set
  %if &state=CA %then %do;
      cahosp; ➊
  %end;
  %else %do;
      azhosp; ➊
  %end;
    where date>'19jun2014'd;
    run;
%mend dastep;
