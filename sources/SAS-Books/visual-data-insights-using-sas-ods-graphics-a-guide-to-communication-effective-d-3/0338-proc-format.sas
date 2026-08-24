proc format;
value MonthNm
  1 = 'January'  2 = 'February'  3 = 'March'
  4 = 'April'    5 = 'May'       6 = 'June'
  7 = 'July'     8 = 'August'    9 = 'September'
10 = 'October' 11 = 'November' 12 = 'December';
run;
/* requires a prior run of Listing 14-0 to create input data:
*/
title; footnote;
ods results off;
ods _all_ close;
ods html5 path="C:\temp" style=GraphFontArial8ptBold
  body="Fig14-1_DowByDayEachMonth1990_WithDataTips.xhtml"
  (title='Dow Jones Composite Index By Trading Day in 1990');
