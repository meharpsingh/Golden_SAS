data _NULL_;
input address $50.;
text = PRXCHANGE('s/\s+([sS]t(reet)?|st\.)\s+/
St. /o',-1,address);
put text;
datalines;
;
