%include "C:\SharedCode\IBM1998CloseAndMaxCloseMacroVariable.sas";
data work.IBM1998Close_CustomDataLabels;
length DataLabelForYandX $ 7;
set work.IBM1998Close;
DataLabelForYandX = put(Close,3.) || ',' ||
put(Date,monname3.);
run;
