data work.ForChart;
length RankedOpinion $ 19;
infile cards;
input @1 Percent 5.2 @7 Opinion $17. @25 RankByAttitude 1.;
PercentAsDecimalPartOfOne = Percent/ 100;
RankedOpinion = put(RankByAttitude,1.) || ':' || Opinion;
cards;
03.00 Very Negative     7
03.50 Negative          6
06.00 Somewhat Negative 5
18.50 Neutral           4
15.75 Somewhat Positive 3
26.75 Positive          2
26.50 Very Positive     1
; run;
;
data work.ToFormat;
retain fmtname 'OpinionFORMAT' type 'C';
set work.ForChart
  (rename=(RankedOpinion=START Opinion=LABEL));
run;
proc format cntlin=work.ToFormat; run;
proc sort data=work.ForChart(drop=Opinion);
by RankedOpinion; run;
ods listing style=GraphFontArial9ptBold gpath="C:\temp" dpi=300;
ods graphics / reset=all noscale width=5.7in height=4.3in
  imagename='Fig5-21_DonutChart_For_Opinions_About_DoughNuts';
title1 'Survey Opinions About Doughnuts - Ordered By Attitude';
title2 color=white 'INVISIBLE Text to create white space';
footnote1 color=white 'INVISIBLE Text to create white space';
footnote2 justify=left
'Data Source: https://aytm.com/blog/doughnuts-survey/';
proc sgpie
data=work.ForChart
;
STYLEATTRS DATACOLORS=(CX0000FF CX6666FF CX9999FF CX999999
                       CXFFCCCC CXFF9999 CXFF0000);
