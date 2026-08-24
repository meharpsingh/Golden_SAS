data shoes;
input before $ after $ count;
datalines;
yes yes 19
yes no
no yes
no no
;
proc freq;
weight count;
