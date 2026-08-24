data neighbor;
length party $ 11 neighborhood $ 10;
input party $ neighborhood $ count @@;
datalines;
democrat
longview
360 democrat
bayside
democrat
sheffeld
140 democrat
highland 160
republican
longview
316 republican
bayside
republican
sheffeld
97 republican
highland 106
independent longview
160 independent bayside
independent sheffeld
311 independent highland 291
;
ods graphics on;
proc freq ;
weight count;
tables party*neighborhood /
plots=mosaicplot chisq cmh nocol nopct;
run;
