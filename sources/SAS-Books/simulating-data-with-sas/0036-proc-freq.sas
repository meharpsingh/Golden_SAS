proc freq data=Sashelp.Class;
tables sex;
ods output OneWayFreqs=Freqs;
run;
