ods results off;
ods _all_ close;
ods printer style=AllTextFontArial11ptBold
  file="C:\temp\Fig13-1_TableAsImage_NotOK.png"
  printer=PNG300 dpi=300;
title1 height=8pt color=white "White Space";
title2 "Male Student Information";
proc print data=sashelp.class;
where Sex EQ 'M';
id Name;
var Age Height;
run;
