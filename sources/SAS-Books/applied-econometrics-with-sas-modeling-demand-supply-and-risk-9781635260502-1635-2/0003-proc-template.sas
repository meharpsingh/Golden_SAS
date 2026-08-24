proc template;
   define statgraph cobbdouglas_contour;
      begingraph;
         entrytitle "Cobb-Douglas Utility Function";
         layout overlay;
            contourplotparm x = x1 y = x2 z = u /
               contourtype = fill nhint = 10 colormodel =
twocolorramp name = "Contour";
            continuouslegend "Contour" / title = "Utility";
         endlayout;
   endgraph;
end;
run;
