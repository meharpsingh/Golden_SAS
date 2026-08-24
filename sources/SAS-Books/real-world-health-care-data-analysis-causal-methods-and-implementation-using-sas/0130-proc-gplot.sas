PROC GPLOT DATA=LSMEANS3;
  PLOT ESTIMATE*VISIT_=OPIyn / VAXIS=AXIS1;
  TITLE "MSM Estimated Mean Visit-wise Change in BPI-Pain Severity Scores";
  LABEL VISIT_="Visit";
  LABEL OPIyn="Opioid Treatment";
RUN;
GOPTIONS RESET=ALL;
