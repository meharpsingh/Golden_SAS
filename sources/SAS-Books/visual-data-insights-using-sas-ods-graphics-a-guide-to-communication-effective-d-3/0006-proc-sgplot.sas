ods graphics / imagename="Fig3-2_Outer_Inner";
title font='Arial/Bold' height=12pt
  'Outer & Inner Borders';
proc sgplot data=sashelp.class;
scatter x=height y=weight; run;
ods graphics / imagename="Fig3-2_Yes_Outer_No_Inner";
title font='Arial/Bold' height=12pt
  'Outer But No Inner Border';
proc sgplot data=sashelp.class noborder;
scatter x=height y=weight; run;
ods graphics / imagename="Fig3-2_No_Outer_Yes_Inner"
noborder;
title font='Arial/Bold' height=12pt
  'Inner But No Outer Border';
proc sgplot data=sashelp.class;
scatter x=height y=weight; run;
ods graphics / imagename="Fig3-2_No_Outer_No_Inner"
noborder;
title font='Arial/Bold' height=12pt
  'No Outer And No Inner Border';
proc sgplot data=sashelp.class noborder;
scatter x=height y=weight; run;
