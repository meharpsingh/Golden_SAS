data trend;
input Outcome $ Dose Count;
datalines;
Success 1 8
Success 2 8
Success 3 10
Success 4 15
Failure 1 12
Failure 2 12
Failure 3 10
Failure 4 5
;
title "Computing Tests for Trend";
proc freq data=trend;
tables Outcome * Dose / cmh trend;
weight Count;
run;
