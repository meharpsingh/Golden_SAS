proc genmod data=PCIstrat descending;
  class thin _strata_;
  model cardcost = thin _strata_ thin*_strata_;
  lsmeans thin thin*_strata_ / pdiff;
  title 'ANOVA model with interactions';
run;
