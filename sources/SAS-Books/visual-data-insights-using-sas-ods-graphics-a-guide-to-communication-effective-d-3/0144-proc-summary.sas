proc summary data=sashelp.cars nway;
class type origin;
var MPG_City MSRP;
output out=work.SUMMARYout mean=;
run;
data work.ToPlot; /* used for all Figures except
7-4 and 7-9 */
set SUMMARYout;
MPG_City = round(MPG_City,1);
MSRPinThousands = round(MSRP / 1000,1); /* MSRP
alternative */
run;
