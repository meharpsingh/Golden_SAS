%MACRO MAKELONG(DATA=,OUT=,COPY=,ID=,ROOT=,MEASUREMENT=Measurement);
PROC TRANSPOSE DATA = &data(keep = &id &copy &root.:)
               OUT  = &out(rename = (col1 = &root))
               NAME = _measure;
 BY &id &copy;
RUN;
*** Create variable with measurement number;
DATA &out;
 SET &out;
 FORMAT &measurement 8.;
 &Measurement = INPUT(TRANWRD(_measure,"&root",''),8.);
 DROP _measure;
RUN;
%MEND;
