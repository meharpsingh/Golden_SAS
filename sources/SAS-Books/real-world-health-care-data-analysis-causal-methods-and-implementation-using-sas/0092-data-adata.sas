data aData;
  set REFL;
  where BPIPain_LOCF>.; * drop records with missing endpoint;
  T=cohort='opioid'; * ATE for opioid vs. non-opioid;
  Y=BPIPain_LOCF-BPIPain_B; * outcome is the change in BPIPain;
  rnd=ranuni(117); * will be used for splitting data into CV bins;
  if e then call symputx('sSiz',_N_); * #patients;
run;
%let verbose=0; * amount of details printed (specify zero to suppress output
  from each sampling iteration);
%let nBin=4; * #training bins i.e. data are split into nBin+1 CV bins (1 bin is the hold-
out);
%let nBoo=1000; * #bootstrap samples;
* potential outcome will be calculated as mixture of the indirect prediction via ATE and
the direct prediction;
%let qw=.5; * mixing factor for indirect and direct prediction (see macro CvmspeAte);
*** global macro variables;
%global Sigma2Hat;  * placeholder for scale for exp weighting;
%global exeDatBinN; * placeholder for #bins in Dat (see macro exeDat);
%global fit; *placeholder for fit details from PS/Outcome models;
*** list of PS models;
