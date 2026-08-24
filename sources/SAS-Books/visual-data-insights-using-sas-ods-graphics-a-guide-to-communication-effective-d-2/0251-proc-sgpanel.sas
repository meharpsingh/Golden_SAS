proc sgpanel data=sashelp.cars;
panelby Type / layout=columnlattice
  onepanel novarname noheaderborder spacing=3;
