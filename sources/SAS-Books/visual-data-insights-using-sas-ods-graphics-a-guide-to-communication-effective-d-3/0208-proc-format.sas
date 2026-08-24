proc format;
value MonthNm
  1 = 'January'  2 = 'February'  3 = 'March'
  4 = 'April'    5 = 'May'     6 = 'June'
  7 = 'July'     8 = 'August'    9 = 'September'
10 = 'October' 11 = 'November' 12 = 'December';
run;
/* requires a prior run of Listing 8-0 to create input
data: */
ods listing style=GraphFontArial8ptBold gpath="C:\temp"
dpi=300;
