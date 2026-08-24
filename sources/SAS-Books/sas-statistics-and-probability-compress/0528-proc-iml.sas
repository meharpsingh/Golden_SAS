proc iml;
title;
start re;
use nls;
read all into y var{lwage};
read all into xs var{exper exper2 tenure tenure2 south union};
n = 716;
t = 5;
/* names for re & between estimator parameters */
parmname = {intercept exper exper2 tenure tenure2 south union};
/* names for fe estimator parameters */
parmfe = {exper exper2 tenure tenure2 south union};
