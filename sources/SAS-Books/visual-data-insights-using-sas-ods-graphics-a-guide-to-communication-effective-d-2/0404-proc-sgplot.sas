ods results=off;
ods _all_ close;
ods listing style=listing gpath='C:\temp' dpi=300;
ods graphics on / reset=all noscale
  width=5.7in /* Available page width in this book */
              /* Accepting the default height */
  imagename='Fig3-1_INSETandTEXTstatementsAndTitlesAndFootnotes';
title1 font='Arial/Bold' height=10pt justify=CENTER
  'Scatter Plot of Height versus Age for Two Students in SASHELP.CLASS';
/* leading spaces in remaining titles to align them with TITLE1 */
title2 font='Arial/Bold' height=10pt justify=LEFT
  'Text locations using ' color=blue
  'INSET Statements';
title3 font='Arial/Bold' height=10pt justify=LEFT
  'Name values placed at Height-Age locations using the ' color=red 'TEXT Statement';
footnote1 font='Arial/Bold' height=10pt
  justify=left 'JUSTIFY=LEFT'
  justify=center 'JUSTIFY=CENTER (the default)'
  justify=right 'JUSTIFY=RIGHT';
footnote2 font='Arial/Bold' height=10pt justify=left
  'Up to 10 FOOTNOTE statements, FOOTNOTE1 to FOOTNOTE10.';
footnote3 font='Arial/Bold' height=10pt justify=left
  'FOOTNOTE is a synonym for FOOTNOTE1.';
footnote3 font='Arial/Bold' height=10pt justify=left
  'The default color is black.';
footnote4 font='Arial/Bold' height=10pt justify=left
  'Rules are the same for TITLE statements.';
proc sgplot data=sashelp.class noborder noautolegend;
where name IN ('Carol' 'Mary');
text x=age y=height text=name / position=Top
  textattrs=(color=red  family=Arial size=10pt weight=Bold);
inset 'Top Left'     / position=TopLeft
  textattrs=(color=blue family=Arial size=10pt weight=Bold);
inset 'Top'          / position=Top
  textattrs=(color=blue family=Arial size=10pt weight=Bold);
inset 'Top Right'    / position=TopRight
  textattrs=(color=blue family=Arial size=10pt weight=Bold);
inset 'Right'        / position=Right
  textattrs=(color=blue family=Arial size=10pt weight=Bold);
inset 'Bottom Right' / position=BottomRight
  textattrs=(color=blue family=Arial size=10pt weight=Bold);
inset 'Bottom'       / position=Bottom
  textattrs=(color=blue family=Arial size=10pt weight=Bold);
inset 'Bottom Left'  / position=BottomLeft
  textattrs=(color=blue family=Arial size=10pt weight=Bold);
