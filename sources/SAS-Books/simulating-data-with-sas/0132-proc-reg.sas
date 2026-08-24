ods graphics off;
proc reg data=Sashelp.Class;
model Weight = Height;
ods select FitStatistics ParameterEstimates;
quit;
