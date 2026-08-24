proc mianalyze parms=mixbetap0 covb=mixbetav0;
title "Multiple Imputation Analysis for Fixed Effects";
var as081 as082 as101 as102 as121 as122 as141 as142;
run;
proc mianalyze parms=mixalfap0 covb=mixalfav0;
title "Multiple Imputation Analysis for Variance Components";
var CS Residual;
run;
