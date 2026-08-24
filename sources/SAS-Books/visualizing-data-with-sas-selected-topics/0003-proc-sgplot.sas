proc sgplot data=QTcBand;
  format week qtcweek.;
  band x=wk lower=L0  upper=L30 / fill legendlabel='Normal' name='a'
       fillattrs=(color=white transparency=0.6) ;
  band x=wk lower=L30 upper=L60 / fill legendlabel='Concern' name='b'
       fillattrs=(color=gold transparency=0.6) ;
  band x=wk lower=L60 upper=L90 / fill legendlabel='High' name='c'
       fillattrs=(color=pink transparency=0.6);
  vbox qtc / category=week group=drug groupdisplay=cluster
       nofill name='d';
  text x=wk y=ylabel text=label / contributeoffsets=none;
  xaxistable risk / class=drug colorgroup=drug location=inside;
  refline 26 / axis=x;
  xaxis type=linear values=(1 2 4 8 12 16 20 24 28) valueshint
        min=1 max=29 display=(nolabel)
        colorbands=odd colorbandsattrs=(transparency=1);
  yaxis label='QTc change from baseline' values=(-120 to 90 by 30);
  keylegend 'a' / title='Treatment:' linelength=20;
run;
