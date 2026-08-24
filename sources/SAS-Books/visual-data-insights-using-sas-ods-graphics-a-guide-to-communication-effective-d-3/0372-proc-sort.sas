ods results off;
ods _all_ close;
options nocenter; /* THIS CAN PERSIST AFTER THIS CODE HAS RUN
*/
proc sort data=sashelp.class(keep=Age) out=work.DistinctAges
  nodupkey;
by Age;
run;
/* create a macro variable for each distinct age */
data _null_;
set work.DistinctAges end=LastOne;
call symput('Age'||trim(left(_N_)),trim(left(Age)));
if LastOne;
call symput('HowMany',_N_);
run;
%macro TableByAge(AgeCount);
%do i = 1 %to &AgeCount %by 1;
ods html5 path="C:\temp"
  body="Fig14-12_TableForAge&&Age&i...xhtml"
  (title="Students with Age = &&Age&i")
  style=AllTextFontArial12ptBold;
title1 "Students with Age = &&Age&i";
title2 justify=left color=blue underline=1
  link="C:\temp\Fig14-12_AverageHeightByAge.xhtml"
  'Go To Chart of Average Height By Age';
proc print data=sashelp.class(where=(Age EQ &&Age&i)) noobs
  style(header) = [backgroundcolor=white]; /* replace gray */
var Name Sex Height Weight;
run;
ods html5 close;
%end;
%mend  TableByAge;
/* create a tabular web page for each age value */
options mprint;
%TableByAge(&HowMany);
data work.ClassWithLinks;
length LinkVar $ 27;
set sashelp.class;
LinkVar = "Fig14-12_TableForAge" || trim(left(Age)) ||
".xhtml";
run;
/* create the web graph with hot link at each bar */
ods html5 path="C:\temp"
  body="Fig14-12_AverageHeightByAge.xhtml"
  (title="Students Average Height By Age")
  style=AllTextFontArial12ptBold;
