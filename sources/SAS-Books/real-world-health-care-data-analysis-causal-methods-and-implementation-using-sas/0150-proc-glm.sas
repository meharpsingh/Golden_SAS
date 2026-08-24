proc GLM data=allPS;
  class cohort(ref="non-opioid");
  model GSPS=cohort errorPS/solution;
run;
