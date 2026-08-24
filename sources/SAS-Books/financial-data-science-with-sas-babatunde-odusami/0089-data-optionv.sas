data optionv;
      XP       = 3844.16;
      rf       = 0.04339;
      price       = 3844.16;
      vol       = 0.19031;
      time       = 0.087611225;
      c=BLKSHCLPRC(xp,time,price,rf,vol);
      p=BLKSHPTPRC(xp,time,price,rf,vol);
      label
             XP        =       'Exercise Price'
             rf        =       'Risk free rate'
             price     =       'Current Price'
             vol       =       'Volatility'
             time      =       'Time'
             C ='Call Price'
             P ='Put Price';
      format rf percent8.2 vol percent8.2 time
run;
/*SAS Program to Calculate Black-Scholes Option
proc print data=optionv noobs label;
      title 'Valuing S&P 500 Index Options';
      var XP rf       price vol time;
      var c p /style(data)=[fontweight=bold  ba
run;
title;
