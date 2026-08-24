%macro SimpleRandomize(n,groupdata, seed);
   proc iml;
      use &groupdata.;
      read all;
      call randseed(&seed);
      u=j(&n,1);
      prob=ratio/sum(ratio);
      agroup=j(&n,1);
      call randgen(u, "Uniform");
      cprob = j(nrow(group),1);
      do j=1 to nrow(group);
         cprob[j]=sum(prob[1:j]);
      end;
      do j=1 to &n;
         k=1;
         do while (u[j]>cprob[k]);
            k=k+1;
         end;
         agroup[j]=k;
      end;
      group=group[agroup];
      create SimpleRandomization var {group}; /** create data set **/
      append;
   quit;
   proc print data=SimpleRandomization;
   run;
   proc freq data=SimpleRandomization;
      tables group;
   run;
%mend SimpleRandomize;
data ThreeArm;
   input group $ ratio;
   datalines;
   A 1
   B 1
   C 2
   ;
run;
%SimpleRandomize(n=100,groupdata=ThreeArm,seed=6);
