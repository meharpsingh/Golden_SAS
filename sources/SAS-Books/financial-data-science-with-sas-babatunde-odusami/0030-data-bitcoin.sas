data Bitcoin;
      format Date datetime.;
      length Bitcoin 8;
      call streaminit(1);
      InitDate = '1Jan2021:00:00'dt;
      dt=0;
      do I = 1 to 105120;/*Number of 5 mins Interva
             dt+5;
             Date=  intnx''minute'',InitDate,dt);
             Bitcoin = rand''norma'');
             output;
      end;
run;
/*Accumulating Returns into Hourly, Last Observatio
proc timedata data=Bitcoin out=mseries plot=all;
      id date interval=hour
             /*Options include Hour,Day, Week, Mont
      accumulate=last; /*Option include first, mean
      var Bitcoin;
run;
