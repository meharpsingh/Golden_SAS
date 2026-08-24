proc plan seed=123;
factors Block=1 random Gender=2 ordered Pressure=3 ordered Sequence=4
ordered/noprint;
treatments Treatment=4 random;
output out=StratifiedRandomization Gender cvals=('Male' 'Female') ord
       Pressure cvals=('High' 'Normal' 'Low') ordered
 Treatment cvals=('A' 'A' 'B' 'B') random;
run;
proc print data = StratifiedRandomization;
run;
