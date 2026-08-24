%include "C:\SharedCode\AllTextSetup_BlackWhiteTblNoGrid.sas";
%include "C:\SharedCode\AllTextSetup.sas";
options mprint;
ods results off;
ods _all_ close;
options nodate nonumber;
options papersize=(2.13in 3.84in);
title1 height=8pt color=white "White Space";
title2 "Male Student Information";
%AllTextSetup_BlackWhiteTblNoGrid(11,Family=Arial,Weight=Bold);
ods printer style=AllTextFontArial11ptBold_BlackWhiteTblNoGrid
  file="C:\temp\Fig13-3_BlackWhiteTableNoGridAsImage.png"
  printer=PNG300 dpi=300;
proc print data=sashelp.class(where=(Sex EQ 'M'));
id Name; var Age Height;
run;
