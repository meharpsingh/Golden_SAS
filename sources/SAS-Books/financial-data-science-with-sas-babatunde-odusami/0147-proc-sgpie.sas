proc sgpie data=mvmax;
       title1 font=swissb height=2 'Asset Alloc
       title2 font=swissb height=2 '(Return Max
       pie  Ticker / response=Weights otherperc
run;
title1;
title2;
quit;
