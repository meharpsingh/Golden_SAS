ods printer style=AllTextFontArial11ptBold
  file="C:\temp\Fig13-3_Duplicate.png" printer=PNG300 dpi=300;
proc print data=sashelp.class(where=(Sex EQ 'M'))
  style(header)    = [color=black backgroundcolor=white]
  style(obsheader) = [color=black backgroundcolor=white]
  style(obs)       = [color=black backgroundcolor=white]
  style(data)      = [color=black backgroundcolor=white]
  style(table) = [rules=none frame=void];
id Name; var Age Height;
run;
