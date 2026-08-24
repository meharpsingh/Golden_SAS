data _NULL_;
input address $50.;
mypattern = PRXPARSE('s/\s+
(Street|street|St|st|st\.)\s+/ St. /o');
CALL PRXCHANGE(mypattern,-1,address);
put address;
datalines;
;
