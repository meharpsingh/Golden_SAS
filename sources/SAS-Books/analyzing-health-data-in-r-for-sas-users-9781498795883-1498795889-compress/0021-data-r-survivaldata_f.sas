data r.SurvivalData_f;
set r.SurvivalData_e;
ASTHMAGE_MISS = 0;
if ASTHMAGE in (98, 99,.)
then ASTHMAGE_MISS = 1;
run;
proc freq data=r.SurvivalData_f;
table ASTHMAGE * ASTHMAGE_MISS / list missing;
run;
