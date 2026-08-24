/* Merged listing: this program was assembled from 2 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0066-data-simulation.sas --- */
data simulation;
   call streaminit(1234);
   do i = 1 to 10000;
      z = rand('UNIFORM');
      y_gamma = quantile('GAMMA', z, 59.75391, 2.54421);
      y_igauss = quantile('IGAUSS', z, 56.35450, 152.02639);
      y_lnorm = quantile('LOGNORMAL', z, 5.01566, 0.13256);
      y_weibull = quantile('WEIBULL', z, 10.1344, 159.931);
      liab = 2.50 * .75 * 152;
      loss_gamma = max(0, liab - 2.50 * y_gamma);
      loss_igauss = max(0, liab - 2.50 * y_igauss);
      loss_lnorm = max(0, liab - 2.50 * y_lnorm);
      loss_weibull = max(0, liab - 2.50 * y_weibull);
      ld_gamma = (liab > 2.50 * y_gamma);
      ld_igauss = (liab > 2.50 * y_igauss);
      ld_lnorm = (liab > 2.50 * y_lnorm);
      ld_weibull = (liab > 2.50 * y_weibull);
      rate_gamma = loss_gamma / liab;
      rate_igauss = loss_igauss / liab;
      rate_lnorm = loss_lnorm / liab;
      rate_weibull = loss_weibull / liab;
      output;
   end;
run;

/* --- 0067-proc-means.sas --- */
proc means data = simulation;
run;
