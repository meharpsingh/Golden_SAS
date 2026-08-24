%MACRO macroname;
     SAS code;
%MEND macroname;
%MACRO macroname;
     SAS code;
%MEND macroname;
PROC GSLIDE
J
H
DMACRODISCLAIM.SAS
%MACRO DISCLAIM;
PROC GSLIDE;
NOTE J=C H=1
"Data provided by ACME Company exchanges may be delayed";
NOTE J=C H=1
"as specified by financial exchanges or our data providers. ";
run;
