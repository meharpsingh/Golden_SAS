%macro StepDataByDate(
data=
,out=
,DateVar=
,Yvar=
,YvarRescaleDivisor=
,DataLabelVar=DataLabelValue
,DataLabelLength=
,DataLabelFormat=
,StepInterval=
,Filter=);
proc sort data=&data
  out=work.ToPrep
      (keep=&DateVar &Yvar);
%if %length(&Filter) NE 0 %then %do;
&Filter;
%end;
by Date;
run;
data work.ToPlot_&Yvar
  (keep=&DateVar &Yvar &DataLabelVar DropLineYvar);
%if %length(&DataLabelVar) NE 0 AND %length(&DataLabelLength) NE 0 %then %do;
length &DataLabelVar $ &DataLabelLength;
%end;
retain YvalueForPreviousDate TempSaveYvar 0 Seq 0;
set work.ToPrep end=LastOne;
DropLineYvar=&Yvar;
%if %length(&YvarRescaleDivisor) NE 0 %then %do;
&Yvar = &Yvar / &YvarRescaleDivisor;
%end;
Seq + 1;
if _N_ EQ 1 then do;
%if %length(&DataLabelVar) NE 0 AND %length(&DataLabelFormat) NE 0
%then %do;
  &DataLabelVar = put(&Yvar,&DataLabelFormat);
%end;
  DropLineYvar=&Yvar;
  output;
  YvalueForPreviousDate = &Yvar;
end;
else do;
  TempSaveYvar = &Yvar;
  &Yvar = YvalueForPreviousDate;
  &DataLabelVar = ' ';;
  DropLineYvar=&Yvar;
  output;
  Seq + 1;
  &Yvar = TempSaveYvar;
%if %length(&DataLabelVar) NE 0 AND %length(&DataLabelFormat) NE 0
%then %do;
  &DataLabelVar = put(TempSaveYvar,&DataLabelFormat);
%end;
  DropLineYvar=&Yvar;
  output;
  YvalueForPreviousDate = &Yvar;
  if LastOne
  then do;
    Seq + 1;
    &DateVar=intnx("&StepInterval",&DateVar,1);
    &DataLabelVar = ' ';;
    DropLineYvar=.;
    output;
  end;
end;
run;
%mend StepDataByDate;
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
title1 justify=center
'Close Price for IBM Shares on First Trading Day Each Month - 1998';
proc sgplot data=work.ToPlot_Close noautolegend noborder;
series x=Date y=Close /
  lineattrs=(pattern=solid color=green thickness=2);
dropline x=Date y=DropLineYvar /
  dropto=x lineattrs=(pattern=Dot);
text x=Date y=Close text=DataLabelValue /
  TextAttrs=(family='Arial' size=10pt)
  Position=TopRight;
xaxis display=(noline noticks nolabel) type=discrete
  values=(%GetDates)
  valuesdisplay=('Jan' 'Feb' 'Mar' 'Apr' 'May' 'Jun'
                 'Jul' 'Aug' 'Sep' 'Oct' 'Nov' 'Dec' ' ');
yaxis display=none;
run;
ods listing close;
title;
