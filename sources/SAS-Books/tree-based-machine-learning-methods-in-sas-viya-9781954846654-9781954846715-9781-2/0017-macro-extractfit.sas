%macro extractFit(data=, infit=);
data &data.;
set &infit.;
keep trees ase;
rename ase = &data._ase;
run;
