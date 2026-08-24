options linesize=max pagesize=max nocenter nodate nonumber;
title;
ods noproctitle;
ods results off;
ods _all_ close;
ods listing
  file="C:\temp\DirectoryListingForSASUSERdataLibrary.txt";
proc datasets library=sasuser;
contents data=_all_ nods;
run;
