 DATA GRADES;
 INPUT NAME $15. G1 G2 G3;
 AVE=MEAN(of G1-G3);
 DATALINES;
 Alice, Adams  88.4 91 79
 Jones, Steve  99 100 88.4
 Zabar,Fred    78.6 87 88.4
 ;
 RUN;
