data r.BRFSS_c r.BRFSS_b_out;
set r.BRFSS_b;
if VETERAN3=1 then output r.BRFSS_c;
else output r.BRFSS_b_out;
run;
