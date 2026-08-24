data stress;
input region $ stress $ outcome $ count @@;
n_outcome=(outcome='f');
datalines;
urban low
f 48 urban
low
u
;
