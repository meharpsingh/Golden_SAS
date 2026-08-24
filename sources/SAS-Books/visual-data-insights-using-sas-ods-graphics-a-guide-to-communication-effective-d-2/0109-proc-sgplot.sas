proc sgplot data=poly_data noautolegend noborder;
styleattrs datacolors=(CXCCCCFF CX99FF99 CXFFFF99);
yaxis offsetmin=0;
polygon x=x y=y id=ID / fill
  group=ID label=ID
labelattrs=(color=Black); /* The default would use a label color
run;
