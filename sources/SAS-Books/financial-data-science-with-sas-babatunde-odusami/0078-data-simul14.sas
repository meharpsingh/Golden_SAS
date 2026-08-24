%let n=1000;
%let mun    = -0.14594;  /* location parameter
%let sigman = 0.018013; /*Shape Parameter*/
%let mean=0.0067658; /*Mean of Normal distribut
%let ssd =0.04465726;/*STDEV of Normal distribu
data simul14;
       call streaminit(4321);
       do k=1 to 1000;
               xgumb = rand('gumbel',&mun,&sigm
               xgev= rand('extrvalue',&mun,&sig
               xnorm=rand('normal',&mean, &ssd)
               output;
       end;
       label
               xgumb ='Simulated Minimum Gumbel
               xgev ='Simulated Minimum GEV Ret
               xnorm ='Simulated Normal Returns
run;
