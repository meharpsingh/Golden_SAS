%macro RPWrandomize(n1,y1,n2,y2,m,alpha,beta,seed);
   proc iml;
      call randseed(&seed);
      /* # of balls of type A */
      n1ball=&m+&y1*&alpha+(&n2-&y2)*&alpha+&y2*&beta+(&n1-&y1)*&beta;
      /* # of balls of type B */
      n2ball=&m+&y2*&alpha+(&n1-&y1)*&alpha+&y1*&beta+(&n2-&y1)*&beta;
      /* Probability that next drawn ball is A */
      p1=n1ball/(n1ball+n2ball);
      /* Assign the next patient based on p */
      Assignment=j(1);
      call randgen(Assignment, "BERNOULLI",p1);
      if Assignment=1 then Assignment='A';
      else Assignment='B';
      print p1[colname="Allocation probability to arm A" label=""]
      Assignment[colname="Next assignment" label=""];
   quit;
%mend RPWrandomize;
%RPWrandomize(n1=20,y1=14,n2=13,y2=5,m=0,alpha=1,beta=0,seed=123);
