ods listing close;
proc plan seed=56789;
factors block=60 ordered treatment=5;
output out=schedule treatment nvals=(1 1 2 2 3);
data schedule;
set schedule;
an=_n_;
label treatment='Treatment group'
block='Block number'
an='Allocation number';
proc print data=schedule noobs label;
var an treatment block;
ods listing;
run;
