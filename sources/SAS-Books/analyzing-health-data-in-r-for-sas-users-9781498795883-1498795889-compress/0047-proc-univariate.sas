ods trace on /listing;
ods output Moments=r.AlcMoments;
proc univariate data=r.analytic;
        var SLEPTIM2;
        by ALCGRP;
run;
