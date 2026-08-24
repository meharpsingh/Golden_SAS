/* validation bootstrap for extracted snippets */
%let _EXTRACTED_BOOTSTRAP=1;
%let path=%sysfunc(pathname(work));
%let file=%sysfunc(pathname(work))/snippet.csv;

/* Extracted from github-repos/gerhard1050__Applying-Data-Science-Using-SAS/SAS Enterprise Guide Project (with programs and datasets)/ApplyingDataScience_FullSASContent_V1.egp (egp_code 113) */

﻿
data Sales_TargetRatios(keep=empno firstname Quarter Target_Ratio);
 set employees_sales;
 if end = . then end = '01JAN2017'D;
 format Quarter date9.;
 format Target_Ratio percent8.;
 idx=0;
 do while (intnx('QUARTER',start,0) <= intnx('QUARTER',start,idx) <= intnx('QUARTER',end,0));
  quarter = intnx('QUARTER',start,idx);
  Target_Ratio = status*20+rannor(1234)*10+100+duration*(-0.5);
  Target_Ratio = Target_Ratio/100;
  idx=idx+1;
  output;
 end;
run;
/***
proc means data=employees_Sales_expanded;
 class status;
 var Target_Ratio;
run;
***/
