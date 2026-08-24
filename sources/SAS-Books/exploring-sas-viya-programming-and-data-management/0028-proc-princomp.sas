proc princomp data=sashelp.heart out=work.heart_pc plots=(pattern scree);
var AgeAtStart -- Smoking;
run;
