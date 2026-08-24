proc glimmix method=Laplace;
 class portfolio asset type(ref="bond");
  model increase = type day / solution dist=binomial link=logit;
      random intercept / subject=asset(portfolio) type=un;
    covtest/wald;
run;
