  data Test;
input x;
if missing(x) then MissCounter + 1;
  datalines;
  .
  .
  ;
