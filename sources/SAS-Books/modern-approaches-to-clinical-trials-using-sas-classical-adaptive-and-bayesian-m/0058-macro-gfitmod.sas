   %macro gfitmod(savestart=);
      optn={. . . . . . . . . . .};
      /* emax */
      con={. . 0.03, . . 45};      /* bounds: [0.01,1.5]*maxDose for ED50 */
      call nlpqn(rc, xr, "fnglsemax", stemax, optn, con);
      dim=ncol(xr);
      gaicemax=2*fnglsemax(xr)+2*dim;
      paremax=xr;
      if &savestart=1 then
         stemax=xr;
      /* exponential */
      con={. . 3, . . 60};      /* bounds: [0.1,2]*maxDose for delta */
      call nlpqn(rc, xr, "fnglsexpo", stexpo, optn, con);
      dim=ncol(xr);
      gaicexpo=2*fnglsexpo(xr)+2*dim;
      parexpo=xr;
      if &savestart=1 then
         stexpo=xr;
      /* linear */
      start={0 0};
      con={. . , . .};
      call nlpqn(rc, xr, "fnglslin", start, optn, con);
      dim=ncol(xr);
      gaiclin=2*fnglslin(xr)+2*dim;
      parlin=xr;
      /* quadratic */
      start={0 0 0};
      con={. . . , . . . };
      call nlpqn(rc, xr, "fnglsquad", start, optn, con);
      dim=ncol(xr);
      gaicquad=2*fnglsquad(xr)+2*dim;
      parquad=xr;
   %mend;
   /* fit to original data to get good starting values*/
   stemax={-5 2 10};
   stexpo={-5 1.5 40};
   %gfitmod(savestart=1);
   /* sample from multivariate normal distribution and fit models */
   emaxdat=j(nsim, 4, 0);
   expodat=j(nsim, 4, 0);
   quaddat=j(nsim, 4, 0);
   lindat=j(nsim, 3, 0);
   do i=1 to nsim;
      resp=t(randnormal(1, mn, cv));
      %gfitmod(savestart=0);
      emaxdat[i, ]=gaicemax||paremax;
      expodat[i, ]=gaicexpo||parexpo;
      quaddat[i, ]=gaicquad||parquad;
      lindat[i, ]=gaiclin||parlin;
   end;
   create emaxdat from emaxdat[colname={'emax_gaic' 'emax_e0' 'emax_emax'
      'emax_ed50'}];
   append from emaxdat;
   close emaxdat;
   create expodat from expodat[colname={'expo_gaic' 'expo_e0' 'expo_e1'
      'expo_delta'}];
   append from expodat;
   close expodat;
   create quaddat from quaddat[colname={'quad_gaic' 'quad_e0' 'quad_b1'
      'quad_b2'}];
   append from quaddat;
   close quaddat;
   create lindat from lindat[colname={'lin_gaic' 'lin_e0' 'lin_delta'}];
   append from lindat;
   close lindat;
   quit;
   /* postprocessing in data step */
data simresults;
   merge emaxdat expodat quaddat lindat;
   min_gaic=min(emax_gaic, expo_gaic, quad_gaic, lin_gaic);
   array doseresp(101);
   if(emax_gaic=min_gaic) then
      do;
         do i=1 to 101;
            dose=(i-1)/100*30;
            doseresp(i)=emax_emax*dose/(emax_ed50+dose);
         end;
      bestmod='emax';
      end;
   if(expo_gaic=min_gaic) then
      do;
         do i=1 to 101;
            dose=(i-1)/100*30;
            doseresp(i)=expo_e1*(exp(dose/expo_delta)-1);
         end;
      bestmod='exponential';
      end;
   if(lin_gaic=min_gaic) then
      do;
         do i=1 to 101;
            dose=(i-1)/100*30;
            doseresp(i)=lin_delta*dose;
         end;
      bestmod='linear';
      end;
   if(quad_gaic=min_gaic) then
      do;
         do i=1 to 101;
            dose=(i-1)/100*30;
            doseresp(i)=quad_b1*dose+quad_b2*dose**2;
         end;
      bestmod='quadratic';
      end;
   drop i dose;
run;
/* which model is selected how often?  */
proc freq data=simresults;
   tables bestmod;
run;
/* create plot of boostrap quantiles */
proc univariate data=simresults noprint;
   var doseresp1-doseresp101;
   output out=quant25 pctlpts=2.5 pctlpre=dose1-dose101 pctlname=P5;
   output out=quant50 pctlpts=50 pctlpre=dose1-dose101 pctlname=P5;
   output out=quant975 pctlpts=97.5 pctlpre=dose1-dose101 pctlname=P5;
run;
data quant;
   set quant25 quant50 quant975;
run;
proc transpose data=quant out=tquant;
run;
data dosevar;
   do i=1 to 101;
      dose=(i-1)/100*30;
      output;
   end;
   drop i;
run;
data tquant;
   set tquant;
   set dosevar;
run;
data rawest;
   input doseobs diff;
   datalines;
1 0.518
3 1.879
10 2.220
30 1.579
;
run;
data tquant;
   set tquant rawest;
run;
proc sgplot data=tquant;
   xaxis grid label="Dose";
   yaxis grid label="Response (difference to placebo)";
   band x=dose lower=col1 upper=col3 /transparency=0.5
      legendlabel="95% confidence interval";
   series x=dose y=col2 /legendlabel="Model Mean" lineattrs=(thickness=3);
   scatter x=doseobs y=diff / markerattrs=(symbol=circlefilled)
      legendlabel="Estimated slopes from LME model";
run;
