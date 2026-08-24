options mprint;
%StepDataByDate(
data=sashelp.stocks
,out=work.ToPlot
,DateVar=Date
,Yvar=Close
,YvarRescaleDivisor=1
,DataLabelVar=DataLabelValue
,DataLabelLength=5
,DataLabelFormat=5.1
,StepInterval=Quarter
,filter=%str(where year(Date) EQ 1998 and Stock EQ 'IBM';)
);
data _null_;
retain MonthCount 0;
set work.ToPlot_Close end=LastOne;
where DataLabelValue NE ' ';
MonthCount + 1;
call symput('Date'||trim(left(put(MonthCount,3.))),Date);
if LastOne;
Date + 31;
call symput('Date13',Date);
run;
%macro GetDates;
%do i = 1 %to 13 %by 1;
  &&Date&i
%end;
%mend GetDates;
options mprint;
footnote;
ods results off;
ods _all_ close;
ods listing style=GraphFontArial10ptBold gpath="C:\temp" dpi=300;
ods graphics on / reset=all scale=off width=5.7in
  imagename="Fig8-15_UnambiguousMaximallyInformativeStepPlot";
