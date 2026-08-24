libname mycas cas;
proc format casfmtlib='casformats';
value pricerange_cas low-25000="Low"
25000<-50000="Mid"
50000<-75000="High"
75000<-high="Luxury";
run;
data mycas.cars_formatted;
set sashelp.cars;
format MSRP pricerange_cas.;
keep Make Model MSRP MPG_Highway;
run;
proc mdsummary data=mycas.cars_formatted;
var MPG_Highway;
groupby MSRP / out=mycas.cars_summary;
run;
