proc tabulate data=sashelp.cars ;
class origin;
var invoice;
table origin*invoice*mean;
run;
