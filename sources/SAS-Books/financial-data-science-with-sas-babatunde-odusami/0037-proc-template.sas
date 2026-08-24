proc template;
      define statgraph pietemp;
      begingraph;
      entrytitle "Portfolio Sector Weights";
      layout region;
      piechart category=Sector / stat=pct datalabel
      othersliceopts=(percent=1.5);
      endlayout;
      endgraph;
      end;
run;
proc sgrender data=Portfolio_Attrib template=pietem
run;
