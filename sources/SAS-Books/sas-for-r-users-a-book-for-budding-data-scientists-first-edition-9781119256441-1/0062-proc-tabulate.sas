PROC TABULATE DATA=sashelp.cars;
CLASS Make Model ;
var Invoice;
TABLE Make, Invoice*mean;
RUN;
