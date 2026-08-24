data arthritis;
length treatment $7. sex $6. ;
input sex $ treatment $ improve $ count @@;
datalines;
female active
marked 16 female active
some 5 female active
none
female placebo marked
;
