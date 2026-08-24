data TreatedPatients;
   input Intercept Gender Pressure Severity Treatment;
   *Pressure: blood pressure;
   *Severity: Severity score;
   datalines;
1  0  1.16 -0.80  1
1  1  1.84  2.25  1
1  1  0.41 -1.38  0
1  0  0.99  1.12  1
1  1 -1.18 -0.30  0
1  1  1.47 -0.94  0
1  1 -1.16  0.24  1
1  1  1.92 -1.29  1
1  0  1.13 -0.77  0
1  1 -0.42  0.69  0
1  1 -0.17 -0.59  1
1  1 -0.73  1.22  1
1  1 -0.00 -0.59  0
1  1  1.26 -0.45  0
1  0 -0.48  2.23  1
1  1 -0.58 -2.29  0
1  1  0.06 -0.69  1
1  1 -0.09  1.10  1
1  1  0.23 -1.63  1
1  0  0.37 -2.23  0
;
run;
%macro ModelOptRandomize(TreatedPatients,NewPatient,gamma,seed);
   proc iml;
      use &TreatedPatients.;
      read all into X;
      use &NewPatient.;
      read all into Z;
      n=nrow(X);
      call randseed(&seed);
      X[,ncol(X)]=-(X[,ncol(X)]=0)+(X[,ncol(X)]=1);
      delta=X[,ncol(X)];
      X=X[,1:(ncol(X)-1)];
      L=delta`*X*inv(X`*X)*X`*delta;
      R=Z*inv(X`*X)*X`*delta/n;
      p=(1-R)**&gamma/((1-R)**&gamma+(1+R)**&gamma);
      call randgen(u, "Uniform");
      trt=u<p;
      *if trt=0 then trt=-1;
      call symputx("trt",trt);
   quit;
   data &NewPatient.;
      set &NewPatient.;
      Treatment=&trt;
      output;
   run;
   proc append base=&TreatedPatients. data=&NewPatient.;
   run;
%mend ModelOptRandomize;
data NewPatient1;
   input Intercept Gender Pressure Severity;
   datalines;
1  0   0.20   -1.98
;
run;
data NewPatient2;
   input Intercept Gender Pressure Severity;
   datalines;
1  1   -0.80   -0.30
;
run;
data NewPatient3;
   input Intercept Gender Pressure Severity;
   datalines;
1  1   0.15   2.50
;
run;
%ModelOptRandomize(TreatedPatients,NewPatient1,gamma=5,seed=6);
%ModelOptRandomize(TreatedPatients,NewPatient2,gamma=5,seed=6);
%ModelOptRandomize(TreatedPatients,NewPatient3,gamma=5,seed=6);
proc print data=TreatedPatients;
run;
