ods listing style=GraphFontArial11ptBold gpath="C:\temp" dpi=300;
ods graphics on / reset=all scale=off width=5.7in height=3in
  imagename="Fig9-31_PanelOneRow_DataLabelsForY_DropLinesForX";
title1 justify=center "Weight (pounds) vs Height (inches) By Sex";
proc sgpanel data=sashelp.class;
panelby Sex / rows=1 onepanel novarname noheaderborder spacing=10;
scatter x=height y=weight /
datalabel
;
dropline x=height y=weight / dropto=x;
rowaxis display=none;
colaxis
 display=(noline nolabel)
offsetmin=0 /* does not clip any markers */
  values=(51 to 72 by 1) fitpolicy=stagger;
format Weight 3. Height 2.;
run;
