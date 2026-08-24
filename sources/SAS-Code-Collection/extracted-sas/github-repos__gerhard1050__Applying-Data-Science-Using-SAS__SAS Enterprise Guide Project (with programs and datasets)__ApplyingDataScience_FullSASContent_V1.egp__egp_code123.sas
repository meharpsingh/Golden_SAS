/* validation bootstrap for extracted snippets */
%let _EXTRACTED_BOOTSTRAP=1;
%let path=%sysfunc(pathname(work));
%let file=%sysfunc(pathname(work))/snippet.csv;

/* Extracted from github-repos/gerhard1050__Applying-Data-Science-Using-SAS/SAS Enterprise Guide Project (with programs and datasets)/ApplyingDataScience_FullSASContent_V1.egp (egp_code 123) */

﻿/*
data surv.employees2016;
 set surv.employees2016;
 duration_old = duration;
 if end = . then end_tmp = '01JAN2017'd;
 else end_tmp = end;
 StartYear = year(start); drop StartYear;
 Duration = intck('MONTH',start,end_tmp);
 format StartPeriod $14.;
 if StartYear <= 2008 then StartPeriod = "1: 2004 - 2008";
 else if StartYear <= 2013 then StartPeriod = "2: 2009 - 2013";
 else startperiod = "3: 2014-2016";
run;


data surv.employees2016;
 set surv.employees_names;
 duration_old = duration;
 if end = . then end_tmp = '01JAN2017'd;
 else end_tmp = end;
 Status=(end=.);
 StartYear = year(start); drop StartYear;
 Duration = intck('MONTH',start,end_tmp);
 format StartPeriod $14.;
 if StartYear <= 2008 then StartPeriod = "1: 2004 - 2008";
 else if StartYear <= 2013 then StartPeriod = "2: 2009 - 2013";
 else startperiod = "3: 2014-2016";
 Resigned=1-status;
 drop duration_old duration2 end_tmp;
run;

data surv.employees;
 set surv.employees2016;
run;
*/
