proc sgplot data=QTcData;
  format week qtcweek.;
  vbox qtc / category=week group=drug groupdisplay=cluster nofill;
  xaxistable risk / class=drug colorgroup=drug;
  refline 26 / axis=x;
  refline 0 30 60 / axis=y lineattrs=(pattern=shortdash);
  xaxis type=linear values=(1 2 4 8 12 16 20 24 28) max=29
        display=(nolabel);
  yaxis label='QTc change from baseline' values=(-120 to 90 by 30);
  keylegend / title='' linelength=20;
run;
