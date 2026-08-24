proc format;
value pricerange_sas low-25000="Low"
25000<-50000="Mid"
50000<-75000="High"
75000<-high="Luxury";
run;
data cars_formatted;
set sashelp.cars;
format MSRP pricerange_sas.;
keep Make Model MSRP MPG_Highway;
run;
proc print data=cars_formatted;
run;
