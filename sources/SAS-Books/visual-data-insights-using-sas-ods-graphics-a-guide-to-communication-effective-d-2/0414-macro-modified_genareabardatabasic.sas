%macro Modified_genAreaBarDataBasic(
input, output, category, response, width
, datalabel  /* LeRB mod */
);
proc summary data=&input nway;
%if %length(&datalabel) NE 0 %then %do; /* LeRB mod */
id &datalabel; /* LeRB mod */
%end; /* LeRB mod */
class &category;
var &response &width;
output out=_out_totals_ sum=;
run;
data &output;
retain x 0;
label x="&width" y="&response" ID="&category";
set _out_totals_;
ID=&category;
response=&response;
width=&width;
y=0;
x=x;
output;
y=&response;
output;
x = x + &width;
output;
y=0;
output;
run;
