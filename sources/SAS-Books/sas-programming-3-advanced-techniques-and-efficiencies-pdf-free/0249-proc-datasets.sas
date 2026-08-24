proc datasets lib=orion nolist;
   modify shoe_prices;
      index delete Product_ID;
run;
quit;
