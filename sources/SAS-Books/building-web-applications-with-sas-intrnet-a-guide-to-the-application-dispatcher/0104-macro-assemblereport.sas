%macro assembleReport;
 %local entries closeTable;
 %setDefaultValue(layouts,save.Layouts) n
 %setDefaultValue(layout,report1)
 proc sort data=&layouts out=_report; o
  where "%upcase(&layout)" = upcase(layout);
  by order;
 run;
