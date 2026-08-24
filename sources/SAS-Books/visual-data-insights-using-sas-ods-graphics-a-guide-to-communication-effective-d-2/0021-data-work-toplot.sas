data work.ToPlot;
length DataLabelText $ 11;
set SASHELP.CLASS;
DataLabelText= trim(left(name))||','||trim(left(put(age,2.)));
run;
proc sort data=Work.ToPlot;
by sex;
run;
