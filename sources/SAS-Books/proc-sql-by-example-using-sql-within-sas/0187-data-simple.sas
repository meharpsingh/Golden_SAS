DATA simple;
DO Measure = 1 to 3; OUTPUT; END;
RUN;
DATA simple;
SET  simple;
LABEL measure = 'Level reported after calibration';
RUN;
