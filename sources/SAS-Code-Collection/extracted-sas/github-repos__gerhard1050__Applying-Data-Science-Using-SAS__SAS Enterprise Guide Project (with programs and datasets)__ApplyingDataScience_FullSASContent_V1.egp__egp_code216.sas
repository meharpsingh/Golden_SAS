/* validation bootstrap for extracted snippets */
%let _EXTRACTED_BOOTSTRAP=1;
%let path=%sysfunc(pathname(work));
%let file=%sysfunc(pathname(work))/snippet.csv;

/* Extracted from github-repos/gerhard1050__Applying-Data-Science-Using-SAS/SAS Enterprise Guide Project (with programs and datasets)/ApplyingDataScience_FullSASContent_V1.egp (egp_code 216) */

﻿%let snapdate = '31DEC2016'D;
%let start    = '01JAN2004'D;

data _null_;
 MonthCount= intck('MONTH',"&Start"d,&snapdate);
 call symput('MonthCount',MonthCount);
run;
