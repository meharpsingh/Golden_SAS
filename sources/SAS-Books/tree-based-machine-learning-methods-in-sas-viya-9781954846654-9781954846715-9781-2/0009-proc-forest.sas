proc forest data=public.PaySimData (where=(type='CASH_OUT' or
type='TRANSFER'))
       isolation outmodel=public.PaySimIsoForest seed=8844
       ntrees=50 numbin=32 minleafsize=1 maxdepth=8 vars_to_try=3;
input amount oldbalanceOrg newbalanceOrig oldbalanceDest
newbalanceDest / level = interval;
target isFraud / level = nominal;
id nameOrig;
output out=public.PaySimScore copyvars=(_ALL_);
run;
proc print data=public.PaySimScore (obs=10);
var nameOrig amount oldbalanceOrg newbalanceOrig
oldbalanceDest  newbalanceDest isFraud _Anomaly_;
run;
