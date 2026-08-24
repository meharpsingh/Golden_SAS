proc sgplot data = sashelp.heart;
  hbar Weight_Status / group= Chol_Status groupdisplay = cluster
  response = systolic stat = mean;
