%include "C:\SharedCode\AllTextSetup_BlackWhiteTable.sas";
%include "C:\SharedCode\AllTextSetup.sas";
options mprint;
ods results off;
ods _all_ close;
options nodate nonumber;
options papersize=(2.13in 3.84in);
title1 height=8pt color=white "White Space";
title2 "Male Student Information";
%AllTextSetup_BlackWhiteTable(11,Family=Arial,Weight=Bold);
ods printer style=AllTextFontArial11ptBold_BlackWhiteTable
  file="C:\temp\Fig13-2_BlackWhiteTableAsImage.png"
  printer=PNG300 dpi=300;
proc print data=sashelp.class(where=(Sex EQ 'M'));
id Name; var Age Height;
run;
ods printer close;
/* Using a macro only for the text controls, but STYLE()
options for color controls : */
%AllTextSetup(11);
/* OPTIONS and TITLE statements from above persist */
ods printer style=AllTextFontArial11ptBold
  file="C:\temp\Fig13-2_Duplicate.png" printer=PNG300 dpi=300;
proc print data=sashelp.class(where=(Sex EQ 'M'))
  style(header)    = [color=black backgroundcolor=white]
  style(obsheader) = [color=black backgroundcolor=white]
  style(obs)       = [color=black backgroundcolor=white]
  style(data)      = [color=black backgroundcolor=white];
id Name; var Age Height;
run;
