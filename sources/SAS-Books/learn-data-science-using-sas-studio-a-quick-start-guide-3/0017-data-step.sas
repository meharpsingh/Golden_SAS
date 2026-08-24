data step. See Figure 5-4.
data b;
SUM=0;
DO ILOOP=1 to 10 by 2;
  SUM=SUM + ILOOP;
  output;* The OUTPUT statement tells SAS to write
run;
