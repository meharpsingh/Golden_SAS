%macro BayesianRandomize(n1,y1,n2,y2,alpha1=0.5,beta1=0.5,alpha2=0.5,
beta2=0.5,Gamma=1,design=1,N=150,seed=123);
   proc iml;
      call randseed(&seed);
      /* Posterior probability that treatment A is superior to treatment B */
      /* Using MCMC approximation to compute the probability */
      posta=j(10000,1);
      postb=j(10000,1);
      call randgen(posta, "BETA",&y1+&alpha1,&n1-&y1+&beta1);
      call randgen(postb, "BETA",&y2+&alpha2,&n2-&y2+&beta2);
      lambda=sum(posta>postb)/10000;
      if &design=1 then Gamma=&Gamma;
      else Gamma=(&n1+&n2)/&N/2;
      p1=lambda##Gamma/(lambda##Gamma+(1-lambda)##Gamma);
      Assignment=j(1);
      call randgen(Assignment, "BERNOULLI",p1);
      if Assignment=1 then Assignment='A';
      else Assignment='B';
      print Gamma p1[colname="Allocation probability to arm A" label=""]
      Assignment[colname="Next assignment" label=""];
   quit;
%mend BayesianRandomize;
%BayesianRandomize(n1=20,y1=14,n2=13,y2=5,alpha1=0.5,beta1=0.5,
alpha2=0.5,beta2=0.5,design=1,Gamma=1,seed=123);
%BayesianRandomize(n1=20,y1=14,n2=13,y2=5,alpha1=0.5,beta1=0.5,
alpha2=0.5,beta2=0.5,design=2,N=150,seed=123);
