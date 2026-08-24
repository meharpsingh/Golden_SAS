ods listing style=listing;
proc sgplot data=Incidence nowall noborder;
  styleattrs datacolors=(gray pink lightgreen lightblue)
             datacontrastcolors=(black);
  vbar time / response=incidence group=group groupdisplay=cluster;
  xaxis discreteorder=data valueattrs=(size=8) fitpolicy=none
        display=(nolabel);
  yaxis grid display=(noticks);
  keylegend / title='' location=inside position=topright across=1 border
        autoitemsize valueattrs=(size=8);
run;
