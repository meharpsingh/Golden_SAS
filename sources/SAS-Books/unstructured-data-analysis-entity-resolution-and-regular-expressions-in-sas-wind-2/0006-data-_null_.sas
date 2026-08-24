data _NULL_;
input address $50.;
text = PRXCHANGE('s/\s+
(Street|street|St|st|st\.)\s+/ St.
/o',-1,address);
text2 = PRXCHANGE('s/(.+?),*?\s+?(\w+?),*?\s+?
(\w+?)\s+?(\d+?)/$1, $2, $3, $4/o',-1,text);
put text2;
datalines;
;
