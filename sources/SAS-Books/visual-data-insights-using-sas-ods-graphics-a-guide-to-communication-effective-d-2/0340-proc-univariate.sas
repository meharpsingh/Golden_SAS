ods results off;
ods _all_ close;
options nodate nonumber;
title;
ods noproctitle;
ods trace on / listing;
ods listing
  file="C:\temp\Listing13-8_ODSoutputObjectsInPROCunivariate.txt";
proc univariate data=sashelp.class;
var Height;
run;
