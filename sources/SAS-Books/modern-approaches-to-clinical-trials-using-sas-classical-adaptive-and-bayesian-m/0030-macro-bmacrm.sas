%macro BMACRM(currentdata,skeleton,priormodel,target=0.3,toxstop=0.9);
   proc iml;
      use &currentdata.;
      read all;
      use &skeleton.;
      read all into skeleton;
      use &priormodel.;
      read all;
      nmodel=nrow(priormodel);
      ndose=nrow(skeleton);
      dosecurr=doselevel[nrow(doselevel)];
      stop=0;
      /* posterior=likelihood * prior */
      start posterior(alpha) global(DLT,doselevel,p,cohortsize);
         sigma2=2;
         lik=1;
         nn=nrow(DLT);
         do k=1 to nn;
            pi=(p[doselevel[k]])##exp(alpha);
            lik=lik*(pi##(DLT[k]))*((1-pi)##(cohortsize[k]-DLT[k]));
         end;
         lik=lik*exp(-0.5*alpha*alpha/sigma2);
         return(lik);
      finish;
      /* used to calculate the posterior mean of pi */
      start posttoxf(alpha) global(j,DLT,doselevel,p,cohortsize);
         post=p[j]##exp(alpha)*posterior(alpha);
         return(post);
      finish;
      marginalm={};
      povertoxm={};
      pim=repeat(0,ndose,nmodel);
      do md=1 to nmodel;
         p=skeleton[,md];
         lb=log(log(&target)/log(p[1]));
         call quad(marginal, "posterior", {.M .P}) eps=1E-4 peak=-3 scale=0.5
         /* default: PEAK=1 */
         marginalm=marginalm//marginal;
         do j=1 to ndose;
            call quad(pij,"posttoxf",{.M .P}) eps=1E-4 peak=-3 scale=0.5;
            pij=pij/marginal;
            pim[j,md]=pij;
         end;
         call quad(povertox,"posterior",-35||lb) eps=1E-4 peak=-3 scale=0.5;
         povertox=povertox/marginal;
         povertoxm=povertoxm//povertox;
      end;
      posmodel=marginalm#priormodel/sum(marginalm#priormodel);
      pi=pim*posmodel;
      povertox=sum(povertoxm#posmodel);
      if povertox>&toxstop then stop=1;
      diff=abs(pi-&target);
      dosebest=diff[>:<];
      dosenext=dosecurr;
      if dosebest>dosecurr then
         if dosecurr<ndose then do;
         dosenext=dosecurr+1;
      end;
      if dosebest<dosecurr then
         if dosecurr>1 then do;
         dosenext=dosecurr-1;
      end;
      if stop=1 then dosenext="The trial should be early terminated";
      print dosenext;
      doselevel=1:ndose;
      doselevel=doselevel`;
      create doselevel from doselevel[colname="doselevel"];
      append from doselevel;
      create pi from pi[colname="pi"];
      append from pi;
   quit;
   data &skeleton.;
      merge &skeleton. pi doselevel;
   run;
   *title "Skeleton versus Estimated Toxicity Probability";
   proc sgplot data = skeleton;
      vline doselevel / response = p1 markers legendlabel='p1'
markerattrs=(symbol=circlefilled size=10pt) lineattrs=(pattern = solid);
      vline doselevel / response = p2 markers legendlabel='p2'
markerattrs=(symbol=trianglefilled size=10pt) lineattrs=(pattern = solid);
      vline doselevel / response = p3 markers legendlabel='p3'
markerattrs=(symbol=diamondfilled size=10pt) lineattrs=(pattern = solid);
      vline doselevel / response = p4 markers legendlabel='p4'
markerattrs=(symbol=squarefilled size=10pt) lineattrs=(pattern = solid);
      vline doselevel / response = pi markers legendlabel='pi'
markerattrs=(symbol=starfilled size=10pt) lineattrs=(pattern = solid thicknes
      yaxis min = 0 max = 1 label="Toxicity Probability";
      xaxis label="Dose Level";
      refline &target / axis=y label="Toxicity Target"
LABELLOC= INSIDE LABELPOS= min lineattrs=(pattern = shortdash);
      keylegend / location=inside noborder;
   run;
%mend BMACRM;
