%let n=1000;
/*From the output of Program 5.1*/
%let mun    = 0.143661;  /* Upper location para
%let sigman = 0.0129773; /*Upper Shape Paramete
θn -σn
ξn {1 -[-n log (1 -p)]-ξn        ξn ≠0
θn -σn log [-n log (1 -p)]                ξn = 0
data gevvar;
      VaR90=&mun-&sigman*log(-&n*log(1-0.1));
      VaR95=&mun-&sigman*log(-&n*log(1-0.05));
      VaR99=&mun-&sigman*log(-&n*log(1-0.01));
      label
             var90 ='90% VaR'
             var95 ='95% VaR'
             var99 ='99% VaR';
      format var90 percent8.2  var95 percent8.2
run;
title ' One-Month Value-at-Risk for the S&P 500
proc print data=gevvar noobs label;
run;
title;
