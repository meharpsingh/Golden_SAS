proc template;
  define statgraph barchart2;
    begingraph;
      entrytitle "Portfolio Income by Sectors" ;
      layout overlay;
        barchart category=Sector  response=income /
        stat=sum display=all orient=horizontal grou
                  discretelegend "pdisplay";
      endlayout;
       endgraph;
  end;
proc sgrender data=Portfolio_Attrib template=barcha
run;
