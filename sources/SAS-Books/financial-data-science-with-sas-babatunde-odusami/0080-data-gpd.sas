%let n = 1000;
%let sigma =0.03153;
%let xi = 0.0000000105367;
%let xuni=-1;
data GPD;
call streaminit(4321);
      do i = 1 to &n;
             /* Generalized Pareto Parameters(s
             u = rand('uniform');
             xguni=&sigma/&xuni*(u**(-&xuni)-1)
             xgexp=-&sigma*log(u);
             xgpd = &sigma/&xi *(u**(-&xi)-1);
             output;
      end;
      drop i;
      label
             xguni= 'Uniform Generalized Pareto
             xgexp ='Exponential Generalized Pa
             xgpd = 'Generalized Pareto Distrib
run;
ods graphics on;
proc univariate data=gpd;
      var  xguni xgexp xgpd ;
      histogram xguni/ pareto (sigma=&sigma alp
      histogram xgexp/pareto(sigma=&sigma alpha
      histogram xgpd/pareto(sigma=&sigma alpha=
      ods select Histogram ParameterEstimates;
run;
