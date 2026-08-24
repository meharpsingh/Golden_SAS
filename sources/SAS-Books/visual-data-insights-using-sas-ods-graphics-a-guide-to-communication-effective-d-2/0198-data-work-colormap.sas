data work.ColorMap;
retain ID 'Colors';
length Value $ 3 FillColor $ 5;
set sashelp.stocks;
where year(Date) EQ 1998 and Stock EQ 'IBM';
Value = put(Date,monname3.); /* It is necessary to use
