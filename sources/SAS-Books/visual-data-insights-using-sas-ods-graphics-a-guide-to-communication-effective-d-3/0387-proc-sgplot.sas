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
