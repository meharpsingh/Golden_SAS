proc sgplot data=work.ClassWithLinks noborder
  description=' ';
vbar age / response=height stat=mean datalabel
url=LinkVar /* makes each bar a hot link */
  displaybaseline=off
  barwidth=0.5 nooutline fillattrs=(color=blue);
yaxis display=none;
xaxis display=(noline noticks nolabel);
format height 2.;
run;
ods html5 close;
options center; /* undo OPTIONS NOCENTER which would persist
