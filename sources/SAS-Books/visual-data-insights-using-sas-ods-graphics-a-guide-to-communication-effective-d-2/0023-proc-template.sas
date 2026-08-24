ods listing
  file="C:\temp\Listing3-15_ContentsOfSASUSERdotTEMPLAT.txt";
options nocenter nonumber linesize=max pagesize=max;
 title 'Contents of the Default Template Store SASUSER.TEMPLAT';
proc template;
list / store=sasuser.templat;
run;
