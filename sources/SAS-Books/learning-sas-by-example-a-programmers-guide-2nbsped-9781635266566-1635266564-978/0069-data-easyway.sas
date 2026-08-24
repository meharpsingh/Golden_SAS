  data Easyway;
do Group = 'Placebo','Active';
do Subj = 1 to 5;
input Score @;
output;
end;
end;
  datalines;
  250 222 230 210 199
  166 183 123 129 234
  ;
  title "Listing of Data Set Easyway";
  proc print data=Easyway noobs;
  run;
