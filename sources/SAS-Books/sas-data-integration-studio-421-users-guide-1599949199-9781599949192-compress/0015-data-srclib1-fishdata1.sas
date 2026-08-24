LIBNAME srclib1 BASE "\\d18368\sources\sas1_src";
data srclib1.fishdata1;
   infile datalines missover;
   input Location & $10. Date date7.
         Length1 Weight1 Length2 Weight2 Length3 Weight3
         Length4 Weight4;
   format date date7.;
