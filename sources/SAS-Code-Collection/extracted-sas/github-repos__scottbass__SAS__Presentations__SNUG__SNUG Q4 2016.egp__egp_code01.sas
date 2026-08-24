/* validation bootstrap for extracted snippets */
%let _EXTRACTED_BOOTSTRAP=1;
%let path=%sysfunc(pathname(work));
%let file=%sysfunc(pathname(work))/snippet.csv;

/* Extracted from github-repos/scottbass__SAS/Presentations/SNUG/SNUG Q4 2016.egp (egp_code 1) */

﻿* discarding non unique keys just got easier in base SAS ;
* Note: works in SAS 9.3 ;

data test;
   infile cards;
   input id @@;
   cards;
1 2 3 3 3 4 5 6 6 7 8 8 9 10
;
run;

data test_unique1 test_nonunique1;
   set test;
   by id;
   if ^(first.id and last.id) then output test_nonunique1;
   else output test_unique1;
run;

proc sort data=test out=test_nonunique2 uniqueout=test_unique2 nouniquekey;
	by id;
run;

options nocenter;

title "Unique V1";
proc print data=test_unique1;
run;

title "Unique V2";
proc print data=test_unique2;
run;

title "NonUnique V1";
proc print data=test_nonunique1;
run;

title "NonUnique V2";
proc print data=test_nonunique2;
run;

title;
