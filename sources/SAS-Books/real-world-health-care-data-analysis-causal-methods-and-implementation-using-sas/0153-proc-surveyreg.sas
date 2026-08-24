proc surveyreg data=ps_rct;
  class trt;
  weight rwt;
  model Cardcost = trt / solution;
  lsmeans trt/pdiff;
  run;
