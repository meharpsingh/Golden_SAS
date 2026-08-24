%macro ind_plot;
%do __cnt=1 %to &ndisplay.;
simu&__cnt.*dose
%end;
%mend ind_plot;
/* Simulations */
proc iml;
seed=257656897;
z=normal(repeat(seed,&nsim,3));
alpha_sd=sqrt(&alpha_var);
beta_sd=sqrt(&beta_var);
ab_corr=&ab_cov/sqrt(&alpha_var*&beta_var);
alpha_sim=&alpha_mean+alpha_sd*z[,1];
beta_sim=&beta_mean+beta_sd*(ab_corr*z[,1]+sqrt(1-ab_corr**2)*z[,2]);
logED50_sd=sqrt(&log_var);
logED50_sim=&log_est+logED50_sd*z[,3];
ED50_sim=exp(logED50_sim);
