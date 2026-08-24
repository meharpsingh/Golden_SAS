%macro forestStudy (nVarsList=10,maxTrees=200);
%let nTries = %sysfunc(countw(&nVarsList.));
/* Loop over all specified number of variables to try */
%do i = 1 %to &nTries.;
%let thisTry = %sysfunc(scan(&nVarsList.,&i));
%put &nTries.;
/* Run Forest for this number of variables */
proc forest data=&dm_data ntrees=&maxTrees. vars_to_try=&thisTry.;
  partition rolevar='_PartInd_'n (TRAIN='1' VALIDATE='0');
  target 'INS'n / level=nominal;
  input %dm_interval_input / level=interval;
  input %dm_binary_input %dm_nominal_input %dm_ordinal_input
%dm_unary_input / level=nominal;
  id 'IDNUM'n;
  ods output FitStatistics=&dm_lib..fitstats_vars&thisTry.;
run;
/* Add the value of varsToTry for these fit stats */
data &dm_lib..fitstats_vars&thisTry.;
length varsToTry $ 8;
set &dm_lib..fitstats_vars&thisTry.;
varsToTry = "&thisTry.";
run;
/* Append to the single cumulative fit statistics table */
proc append base=&dm_lib..fitStats1
data=&dm_lib..fitstats_vars&thisTry. force;
run;
%end;
%mend forestStudy;
%forestStudy(nVarsList= 3 7 10 15 25 47, maxTrees=100);
data &dm_data_outfit;
set &dm_lib..fitstats1;
run;
