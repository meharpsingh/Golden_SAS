data dose;
    input dose@@;
    datalines;
0 2.5 5 10 20
;
run;
%polyorth(fich_in=dose);
