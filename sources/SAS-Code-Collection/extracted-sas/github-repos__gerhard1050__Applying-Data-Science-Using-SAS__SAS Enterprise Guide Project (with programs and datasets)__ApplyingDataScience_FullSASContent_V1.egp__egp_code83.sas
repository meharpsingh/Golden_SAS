/* validation bootstrap for extracted snippets */
%let _EXTRACTED_BOOTSTRAP=1;
%let path=%sysfunc(pathname(work));
%let file=%sysfunc(pathname(work))/snippet.csv;

/* Extracted from github-repos/gerhard1050__Applying-Data-Science-Using-SAS/SAS Enterprise Guide Project (with programs and datasets)/ApplyingDataScience_FullSASContent_V1.egp (egp_code 83) */

﻿%macro DetectBrkPoint(data=,target=,date=,maxbasis=, 
                      plot=LINE, formatdate=YES, format=8., 
                      reflinesfile = c:/tmp/reflines.sas);

proc sort data=&data out=&data._sort;
 by &date;
run;

proc adaptivereg data=&data._sort plots=all details=bases ;
 model &target = &date %if &maxbasis ne %then %do; / maxbasis=&maxbasis %end;  ;
 ods output BWDParams=KnotPoints;
 output out=&data._&target._adpt predicted=pred_&target.;
run;

data KnotPoints;
 set KnotPoints;
 %IF &formatdate = YES %THEN %DO; format knot date9.; %END; 
run;

proc print data=KnotPoints;run;

filename reflines "&tmpfile";
data _NULL_;
 set KnotPoints;
 where upcase(variable) ne 'INTERCEPT';
 format knot &format.;
 file reflines;
  put @04 "refline " knot " / axis = x;";
run;

proc sgplot data=&data._&target._adpt;
 series x=&date y=pred_&target.;
 %if %upcase(&plot) = LINE %then %do; series x=&date y=⌖ %end;
 %else %if %upcase(&plot) = SCATTER %then %do; scatter x=&date y=⌖ %end;
 %include reflines;
run;

%mend;
