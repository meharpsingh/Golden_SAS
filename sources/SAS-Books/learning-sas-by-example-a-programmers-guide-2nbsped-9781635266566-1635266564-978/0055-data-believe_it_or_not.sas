  data Believe_it_or_Not;
input X;
if X = 3 or 4 then Match = 'Yes';
else Match = 'No';
  datalines;
  .
  ;
  title "Listing of Believe_it_or_Not";
  proc print data=Believe_it_or_Not noobs;
  run;
