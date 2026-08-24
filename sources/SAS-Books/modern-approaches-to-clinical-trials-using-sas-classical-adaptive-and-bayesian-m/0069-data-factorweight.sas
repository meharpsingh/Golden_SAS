data FactorWeight;
   input w;
   datalines;
;
run;
%macro MinimizationRandomize(TreatedPatients,NewPatient,FactorWeight,p,seed);
   proc iml;
      use &TreatedPatients.;
      read all into X;
      use &TreatedPatients.;
      read all var {group};
      use &NewPatient.;
      read all into Y;
      use  &FactorWeight.;
      read all;
      call randseed(&seed);
      X=X//Y;
      imA=0;
      groupA=group//'A';
      do i=1 to ncol(X);
         do j=1 to max(X[,i]);
            imA=imA+w[i]*abs(sum(groupA[loc(X[,i]=j)]='A')
            -sum(groupA[loc(X[,i]=j)]='B'));
         end;
      end;
      imB=0;
      groupB=group//'B';
      do i=1 to ncol(X);
         do j=1 to max(X[,i]);
            imB=imB+w[i]*abs(sum(groupB[loc(X[,i]=j)]='A')
            -sum(groupB[loc(X[,i]=j)]='B'));
         end;
      end;
      print imA imB;
      u=1;
      call randgen(u, "Uniform");
      if (imA<=imB & u<=&p) then
      call symput('newgroup','A');
      if (imA<=imB & u>&p) then
      call symput('newgroup','B');
      if (imA>imB & u<=&p) then
      call symput('newgroup','B');
      if (imA>imB & u>&p) then
      call symput('newgroup','A');
      NextGroup=symget("newgroup");;
      print NextGroup;
   quit;
