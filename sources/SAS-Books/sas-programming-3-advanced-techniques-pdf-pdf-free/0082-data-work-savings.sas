data work.savings;
    input Date date9. Deposits;
    datalines;
07JAN2019 199
04FEB2019 325
04MAR2019 557
01APR2019 1200
06MAY2019 215
03JUN2019 22200
;
run;
proc format;
    picture MyDep
            0-<1000   = '009' (prefix='$')
            1000-high = '$1,000+' (noedit);
run;
title 'Monthly Deposits for Savings';
proc print data=work.savings;
    format Date mmddyy10. Deposits MyDep.;
run;
title;
