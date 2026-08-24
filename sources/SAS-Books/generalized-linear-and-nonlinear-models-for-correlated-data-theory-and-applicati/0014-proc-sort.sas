proc sort data=MCM2 data out=Example2 2 4;
by Subject;
run;
proc transpose data=Example2 2 4 out=pairwise prefix=Core ;
var MCM2Index;
by Subject;
id Core;
run;
title 'Pairwise CCC on original data';
