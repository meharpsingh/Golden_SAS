%let data=SASHELP.CARS;
%let report=Model;
%let measure=Horsepower;
%let measureformat=;
%let stat=SUM;
%let n=10;
title "Most powerful models by horsepower, across countries";
footnote;
%let category=Origin;
/* summarize the data across a category and store */
/* the output in an output data set */
proc means data=&data &stat noprint;
      var &measure;
      class &category &report;
      output out=summary &stat=&measure &category /levels;
run;
/* store the value of the measure for ALL rows and
/* the row count into a macro variable for use  */
/* later in the report */
proc sql noprint;
select &measure,_FREQ_ into :overall,:numobs
from summary where _TYPE_=0;
select count(distinct &category) into
:categorycount from summary;
quit;
/* sort the results so that you get the TOP values */
/* rising to the top of the data set */
proc sort data=work.summary out=work.topn;
  where _type_>2;
  by &category descending &measure;
run;
