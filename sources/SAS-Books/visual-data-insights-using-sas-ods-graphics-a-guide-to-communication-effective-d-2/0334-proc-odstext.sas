options nodate nonumber;
options papersize=("5in" "5.69in"); /* composite width & height */
ods results off;
ods _all_ close;
ods printer printer=PNG dpi=300
file="C:\temp\Fig13-7_Composite.png";
/* ODS PRINTER creates the composite image */
/* ODS LAYOUT places the right items in the right places */
ods layout absolute;
title; footnote; /* nullify any leftover
TITLE or FOOTNOTE statements from earlier in the SAS session. */
/* Inlay a common title. If none set up above with %LET, then blank space occurs */
ods region x=0in y=0in width=5in height=0.6in;
proc odstext;
p ' ' / style={font_size=0.1in}; /* white space */
p "&CommonTitle" / style={&CommonTitleAttrs};
run;
