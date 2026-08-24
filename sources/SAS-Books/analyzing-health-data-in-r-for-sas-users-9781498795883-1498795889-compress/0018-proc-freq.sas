PROC FREQ.
data r.SurvivalData_b;
set r.SurvivalData_a;
ALCGRP = 9;
if (ALCDAY5 <200 & ALCDAY5 ne.)
then ALCGRP = 3;
if ALCDAY5 ge 200 and ALCDAY5 < 777
then ALCGRP = 2;
if ALCDAY5 = 888
then ALCGRP = 1;
DRKMONTHLY = 0;
if ALCGRP = 2
then DRKMONTHLY = 1;
DRKWEEKLY = 0;
if ALCGRP = 3
then DRKWEEKLY = 1;
ASTHMA4 = 9;
if ASTHMA3 = 1
then ASTHMA4 = 1;
If ASTHMA3 = 2
then ASTHMA4 = 0;
