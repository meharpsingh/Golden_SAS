data r.SurvivalData_l;
set r.SurvivalData_k;
ASTHMA50 = 0;
if ASTHMA4 = 1 and ASTHMAGE2 le 50
then ASTHMA50 = 1;
ASTHMA80 = 0;
if ASTHMA4 = 1 and ASTHMAGE2 le 80
then ASTHMA80 = 1;
Preparing Data for Analysis
TIME50 = _AGE80;
if ASTHMA50 = 1
then TIME50 = ASTHMAGE2;
if TIME50 > 50
then TIME50 = 50;
TIME80 = _AGE80;
if ASTHMA80 = 1
then TIME80 = ASTHMAGE2;
if TIME80 > 80
then TIME80 = 80;
run;
proc freq data=r.SurvivalData_l;
table ASTHMA50 * ASTHMAGE2 / list missing;
table ASTHMA80 * ASTHMAGE2 / list missing;
table TIME50 * ASTHMAGE2 / list missing;
table TIME80 * ASTHMAGE2 / list missing;
run;
