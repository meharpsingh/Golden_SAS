proc sort data=sashelp.us_data(keep=state statecode
population_2010)
  out=ForLegendEntriesInDesiredOrder;
where statecode NE 'PR';
by population_2010;
run;
ods listing style=styles.LeRB_FiveColorMap_POGCB
gpath="C:\temp";
ods graphics / reset=all noscale
  width=10in /* default height=7.5in */
  imagename=
'Fig15-
1_FiveColorMap_RationaleRanges_AnnoRankStateCodePopulation';
