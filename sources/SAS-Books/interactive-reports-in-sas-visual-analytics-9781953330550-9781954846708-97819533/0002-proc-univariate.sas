%let lib = jobs;
%let ds = orders43k;
%let libds = &lib..&ds.;
%let _var=orderproductcost;
/****************************************************************
*/
/*  Execute PROC UNIVARIATE with selected variable               */
/****************************************************************
*/
proc univariate data=&libds.;
   var &_var.;
run;
