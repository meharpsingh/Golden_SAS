%macro PrepareAnno(
yvar=,
yvarformat=,
yvarlabelsize=,
xvar=,
xvarformat=,
xvarlabelsize=);
  label = put(&yvar,&yvarformat);
  textsize = &yvarlabelsize;
  anchor = 'bottom';
  output anno;
  label = put(&xvar,&xvarformat);
  textsize = &xvarlabelsize;
  anchor = 'top';
  output anno;
%mend  PrepareAnno;
%macro DoAnno; /* used for REPEATED CONCISE invocations */
%PrepareAnno(
yvar=Close,yvarformat=3.,yvarlabelsize=14,
xvar=Date,xvarformat=monyy5.,xvarlabelsize=13);
%mend  DoAnno;
%macro SparseLineForCategory(Category=,Value=);
data work.CloseByMon;
set work.CloseByStockByMon;
WHERE &Category EQ "&Value";
run;
proc means data=work.CloseByMon min max noprint;
  var Close;
  output out=MinMax;
run;
data _null_;
set MinMax end=LastOne;
retain MinY MaxY;
if _STAT_ EQ 'MIN'
then do;
  MinY = Close;
  call symput('MinYvalue',Close);
end;
else
if _STAT_ EQ 'MAX'
then do;
  MaxY = Close;
  call symput('MaxYvalue',Close);
end;
if LastOne;
call symput('YvalueRange',MaxY - MinY);
run;
data anno(keep=
  x1 y1 label anchor function x1space y1space
  border
  justify
  layer
  rotate
  textcolor
  textfont
  textsize
  textstyle
  textweight
  transparency);
length
  label $ 16
  anchor $ 11;
