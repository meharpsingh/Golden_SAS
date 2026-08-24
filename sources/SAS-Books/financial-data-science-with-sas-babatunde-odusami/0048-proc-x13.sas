ods graphics on;
/*Using X13 to Adjust for Seasonality in Retail
ods output D8A=MRTSAG_D8;
ods output D10=MRTSAG_D10;
proc x13 data=trade date=date seasons=12 interv
       var MRTSAG;
       transform power=0;
       arima model=((0,1,1)(0,1,1) );/*ARIMA wi
       estimate;
       x11;
       output out=adjtrade a1 d8 d10 d11;
       /* a1 =original series| d8=Seasonality t
run;
data stest;
       set MRTSAG_D8 (where=(cvalue1 ^='') keep
       rename label1 = 'Seasonality Tests'n;
       rename cvalue1 = 'Probability Level'n;
run;
proc print data= stest noobs;
run;
