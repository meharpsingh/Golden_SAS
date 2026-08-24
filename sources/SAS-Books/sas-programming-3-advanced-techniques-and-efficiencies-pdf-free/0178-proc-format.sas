proc format;
   picture us_phone_withzeros
      low-<10000000='0 (000) 000-9999'
      10000000-high='0 (000) 000-9999' (prefix='(');
run;
