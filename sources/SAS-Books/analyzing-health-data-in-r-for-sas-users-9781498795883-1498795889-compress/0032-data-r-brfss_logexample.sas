data r.BRFSS_LogExample;
set r.BRFSS_a;
LOGASTHMAGE = log(ASTHMAGE);
run;
