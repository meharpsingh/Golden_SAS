proc format;
picture AbsoluteValue_TwoDigits
  low-<0='00' 0<-high='00';
picture AbsoluteValue_ThreeDigits
  low-<0='000' 0<-high='000';
run;
data work.ToChart(keep=Age GirlHgt BoyHgt GirlWgt BoyWgt);
set sashelp.class;
if Sex EQ 'F' then do;
  GirlHgt = 0 - Height; GirlWgt = 0 - Weight;
end;
else do;
  BoyHgt = Height; BoyWgt = Weight;
end;
run;
ods listing style=GraphFontArial9ptBold gpath="C:\temp" dpi=300;
ods graphics on / reset=all scale=off width=5.7in height=3in
  imagename="Fig4-19_OneCatVarFourRespVars_OverlayButterFlyChart";
title justify=center
  "Average Height (inches) and Weight (pounds) of Students By Age
and Sex";
proc sgplot data=work.ToChart noborder;
hbar age / response=BoyHgt y2axis stat=mean discreteoffset=-0.2
  name='BoyHgts' legendlabel="Boy Height"
  displaybaseline=off nooutline barwidth=0.4
  fillattrs=(color=red) datalabel;
hbar age / response=BoyWgt y2axis stat=mean discreteoffset=+0.2
  name='BoyWgts' legendlabel="Boy Weight"
  displaybaseline=off nooutline barwidth=0.4
  fillattrs=(color=CXFF9999) datalabel;
hbar age / response=GirlHgt stat=mean discreteoffset=-0.2
  name='GirlHgts' legendlabel="Girl Height"
  displaybaseline=off nooutline barwidth=0.4
  fillattrs=(color=blue) datalabel;
hbar age / response=GirlWgt stat=mean discreteoffset=+0.2
  name='GirlWgts' legendlabel="Girl Weight"
  displaybaseline=off nooutline barwidth=0.4
  fillattrs=(color=CX9999FF) datalabel;
format Age 2. BoyHgt GirlHgt AbsoluteValue_TwoDigits.
              BoyWgt GirlWgt AbsoluteValue_ThreeDigits.;
xaxis display=none;
yaxis display=(noticks noline nolabel);
y2axis display=(noticks noline nolabel);
keylegend 'GirlHgts' 'GirlWgts' 'BoyHgts' 'BoyWgts' /
  noborder title='' autooutline fillheight=9pt fillaspect=golden;
run;
