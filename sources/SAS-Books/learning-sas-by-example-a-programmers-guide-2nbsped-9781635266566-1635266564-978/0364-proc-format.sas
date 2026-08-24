libname learn 'c:\books\learning';
options fmtsearch=(learn);
proc format library=learn fmtlib;
   value yesno 1='Yes' 2='No';
   value $yesno 'Y'='Yes' 'N'='No';
   value $gender 'M'='Male' 'F'='Female';
