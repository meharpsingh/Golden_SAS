proc sgplot data=work.ToPlot1991 noborder;
styleattrs datacontrastcolors=(blue red purple);
series y=CitiValue x=Month / Group=CitiVar
  datalabel markers
  markerattrs=(symbol=CircleFilled size=7px)
  lineattrs=(pattern=solid thickness=2px)
  smoothconnect; /* not jagged */
yaxis display=none values=(4 to 11 by 1)
  offsetmin=0.05 offsetmax=0.05;
xaxis display=(nolabel noline noticks) grid;
keylegend / title='' noborder autoitemsize;
format CitiVar $CitiVarName.;
run;
