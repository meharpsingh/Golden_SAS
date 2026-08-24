%include "C:\SharedCode\AllTextSetup_CompactBlkWhtTable.sas";
%include "C:\SharedCode\AllTextSetup.sas";
options mprint;
ods results off;
ods _all_ close;
options nodate nonumber;
options papersize=(2.13in 2.5in);
        /* 2.5in would be 3.84in if not compacted */
title1 height=8pt color=white "White Space";
title2 "Male Student Information";
%AllTextSetup_CompactBlkWhtTable(
  11,CellHeight=8pt,Family=Arial,Weight=Bold);
ods printer style=AllTextFontArial11ptBold_CompactBlkWhtTable
  file="C:\temp\Fig13-4_CompactBlackWhiteTableAsImage.png"
  printer=PNG300 dpi=300;
proc print data=sashelp.class(where=(Sex EQ 'M'));
id Name; var Age Height;
run;
