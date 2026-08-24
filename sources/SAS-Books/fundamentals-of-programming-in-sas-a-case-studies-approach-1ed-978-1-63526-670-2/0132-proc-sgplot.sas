proc sgplot data = sashelp.heart;
  hbar Chol_Status / group=Weight_Status groupdisplay = cluster
  response = systolic;
run;
