/* validation bootstrap for extracted snippets */
%let _EXTRACTED_BOOTSTRAP=1;
%let path=%sysfunc(pathname(work));
%let file=%sysfunc(pathname(work))/snippet.csv;

/* Extracted from github-repos/sascommunities__sas-global-forum-2021/papers/1151-2021-Amrhein/Introduction to Causal Analyses Using SAS.ipynb (ipynb 6) */

data heart;
  set sashelp.heart;
  cholesterol=cholesterol/10;
  chd5yr = (ageatstart le agechddiag le (ageatstart+5));
  if bp_status="Optimal" then bp_status="Normal";
  if smoking_status ne "Non-smoker" then smoking_status="Smoker";
run;
proc causalmed data=heart;
  title "Mediation Analysis: Smoking";
  class bp_status(ref='Normal') chd5yr(ref='0');
  model chd5yr=smoking bp_status;
  mediator bp_status=smoking;
  covar ageatstart;
run;
