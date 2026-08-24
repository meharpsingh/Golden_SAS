filename xmllst "&path\data\E1_6_2list.xml";
libname toxml xml xmlfileref=xmllst; n
* create a xml file (E1_6_2list.xml);
data toxml.patlist; o
   set advrpt.demog(keep=lname fname sex dob);
   run;
* convert xml to sas;
data fromxml;
   set toxml.patlist; o
   run;
title1 '1.6.1 Using ODS MARKUP';
ods markup file="&path\data\E1_6_1Names.xml"; n
* create a xml file of the report; o
proc print data=advrpt.demog;
   var lname fname sex dob;
   run;
ods markup close; p
