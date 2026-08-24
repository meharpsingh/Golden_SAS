proc sgplot data=sashelp.class(where=(name =: 'J')) noborder
  description=' ';
scatter x=height y=weight /
  tip=(name age height weight)
  tipformat=(auto auto F4.1 F3.)
  tiplabel=('Student' 'Age' 'Height (inches)' 'Weight (pounds)')
  markerattrs=(symbol=CircleFilled color=green);
xaxis display=(noline noticks nolabel) values=(51 to 65 by 2);
yaxis display=(noline noticks nolabel) values=(50 to 120 by 10);
run;
