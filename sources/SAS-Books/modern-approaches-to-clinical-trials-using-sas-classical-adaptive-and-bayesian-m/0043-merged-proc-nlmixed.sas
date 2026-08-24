/* Merged listing: this program was assembled from 3 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0043-data-dose.sas --- */
data dose;
    input dose@@;
    datalines;
0 2.5 5 10 20
;
run;
%macro simu(n=, e0=-1.39, emax=3.54, ed50=5.5, h=1);
    proc sql noprint;
       select count(dose)into:ngrp
       from dose;
    quit;
    %let ngrp= &ngrp. ;
    data _null_;
         set dose;
         pai=exp(&e0.+((&emax.*dose**&h.)/(&ed50.**&h.+dose**&h.)))/
             (1+exp(&e0.+((&emax.*dose**&h.)/(&ed50.**&h.+dose**&h.))));
         call symput(compress( "pai" ||put(_n_, 1. )), compress(pai) ) ;
         call symput(compress( "dose" ||put(_n_, 1. )), compress(dose) ) ;
    run ;
    %do i=1 %to &ngrp.; %put *** Group &i. **** &&pai&i.; %end;
    proc iml ;
         prob= { %do i=1 %to &ngrp.; &&pai&i. %end; };
         p = repeat(prob,&n.);   /* repeat row n times: n/group */
         call streaminit( 321 ); /* call randseed(321) to set seed number; */
         x = rand( "Bernoulli" , p);

/* --- 0044-data-mydata.sas --- */
     data mydata;                /* add an observation number for transpose*/
          set mydata;
          id=_n_;
     run;
     proc transpose data=mydata out=mydatat ;
          var col1-col&ngrp. ;
          by id;
     run;
     data xdose;             /* add the different COLn to retreive the dose*/
          set dose;
          _name_= compress("COL" || put(_n_, 1. ));
     run;
     proc sql noprint;        /* retrieve the dose for the different groups*/
          create table dstbin as
           select a.id as obs, a.col1 as resp, b.dose
           from mydatat a left join xdose b
           on a._name_=b._name_
           order by b.dose, a.id;
          create table resp as
           select dose, sum(resp) as count, count(*) as n,
                  sum(resp)/count(*) as pai
           from dstbin
           group by dose ;
     quit;
     proc print data =resp;
     run ;
%mend;
%simu(n=60, e0=-1.39, emax=3.54, ed50=5.5, h=1);

/* --- 0045-proc-nlmixed.sas --- */
proc nlmixed data=resp alpha=0.05 ;
   *****specify that ed50 must be positive;
   bounds ed50>0;
   *****define models;
   if dose=0 then eta = e0;
   else eta = e0 + ((emax*dose**h)/(ed50**h+dose**h));
   expeta = exp(eta);
   p = expeta/(1+expeta);
   model count ~ binomial(n, p);
   *****estimate the difference in proportions (dose group-control group);
   estimate "Diff Props (20 mg - control group)"
             exp(e0+(emax*20**h/(ed50**h+20**h)))/(1+exp(e0+
             (emax*20**h /(ed50**h+20**h))))-exp(e0)/(1+exp(e0));
   estimate "Diff Props (10 mg - control group)"
             exp(e0+(emax*10**h/(ed50**h+10**h)))/(1+exp(e0+
             (emax*10**h /(ed50**h+10**h))))
             - exp(e0)/(1 + exp(e0));
   estimate "Diff Props (5 mg - control group)"
             exp(e0+(emax*5**h/(ed50**h+5**h)))/(1+exp(e0+
             (emax*5**h /(ed50**h+5**h))))- exp(e0)/(1 + exp(e0));
   estimate "Diff Props (2.5 mg - control group)"
             exp(e0+(emax*2.5**h /(ed50**h+2.5**h)))/(1+exp(e0+
             (emax*2.5**h /(ed50**h+2.5**h))))-exp(e0)/(1+exp(e0));
   predict p out=etahat;
   *****output estimations;
   *****data est will have output for estimate statement;
   *****data parms will have output for parameters;
   ods output AdditionalEstimates=est
              ParameterEstimates=parms;
run;
