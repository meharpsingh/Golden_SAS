proc sgscatter data=&dt;
matrix &vars_cont;
run;
%end;
%mend;
