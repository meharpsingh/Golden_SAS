proc template;
   define statgraph cobbdouglas_3d_graph;
      begingraph;
         entrytitle "Cobb-Douglas Utility Function";
         layout overlay3d;
            surfaceplotparm x = x1 y = x2 z = u /
               surfacetype = fill;
         endlayout;
      endgraph;
   end;
run;
