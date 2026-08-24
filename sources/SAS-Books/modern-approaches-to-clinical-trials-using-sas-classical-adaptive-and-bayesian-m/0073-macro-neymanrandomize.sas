%macro NeymanRandomize(n1,y1,n2,y2,seed);
   proc iml;
      call randseed(&seed);
      /* Estimate of p1 */
      p1=&y1/&n1;
      /* Estimate of p2 */
      p2=&y2/&n2;
      /* Neyman's allocation ratio */
      r1=sqrt(p1*(1-p1)/p2/(1-p2));
      p1=r1/(1+r1);
      /* Assign the next patient based on p */
      Assignment=j(1);
      call randgen(Assignment, "BERNOULLI",p1);
      if Assignment=1 then Assignment='A';
      else Assignment='B';
      print p1[colname="Allocation probability to arm A" label=""]
      Assignment[colname="Next assignment" label=""];
   quit;
%mend NeymanRandomize;
%macro OptimalRandomize(n1,y1,n2,y2,seed);
   proc iml;
      call randseed(&seed);
      /* Estimate of p1 */
      p1=&y1/&n1;
      /* Estimate of p2 */
      p2=&y2/&n2;
      /* Neynman allocation ratio */
      r1=sqrt(p1/p2);
      p1=r1/(1+r1);
      /* Assign the next patient based on p */
      Assignment=j(1);
      call randgen(Assignment, "BERNOULLI",p1);
      if Assignment=1 then Assignment='A';
      else Assignment='B';
      print p1[colname="Allocation probability to arm A" label=""]
      Assignment[colname="Next assignment" label=""];
   quit;
%mend OptimalRandomize;
%NeymanRandomize(n1=20,y1=14,n2=13,y2=5,seed=123);
%OptimalRandomize(n1=20,y1=14,n2=13,y2=5,seed=123);
