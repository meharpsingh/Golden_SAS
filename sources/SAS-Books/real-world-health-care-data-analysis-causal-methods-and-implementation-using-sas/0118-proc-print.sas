ods rtf select all;
proc print data=mu_hat noobs label;
       label mu_hat="μ_hat(w)";
  format w cohort.;
run;
* report tau (estimated treatment differences and confidence intervals;
title1 "#wild bootstraps: &Nwboo (time elapsed: &elsec sec)";
proc print data=tau_var(drop=err) noobs label;
       label wprim="w'"
                     tau="tau (w vs. w')"
      tau_95lo='lower limit of 95% CI'
      tau_95up='upper limit of 95% CI'
      pval='p-value';
  format w wprim cohort. pval pvalue5.;
run;
title1;
