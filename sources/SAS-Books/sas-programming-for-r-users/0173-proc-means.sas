proc means data=&dt &opts;
var &vars_cont;
run;
%end;
