proc summary data=sashelp.cars nway;
class type origin;
var MPG_City MSRP;
output out=work.SUMMARYout mean=;
run;
