%let N=100;
%let sigma=0.001;
%let mu=0;
proc iml;
       Rt =j(&n,2,.);
       xj= j(&n,1,.);
       InitDate = '2Jan2021:00:00'dt; /*Initial Date*/
       call randseed(4321);
       call randgen(xj,"Normal",&mu,&sigma);
       Rt[,2]=xj;
       Rt[,2]=cusum(Rt[,2]); /*Cumulating Values over time*/
       dt=0;
       do i = 1 to &n;
               dt=dt+1;
               Rt[i,1]=intnx('minutes',InitDate,dt);/*Simulating
       end;
       vname ={"Date" "Ret"}; /*specify column and row label*/
       create simul7B from Rt[colname=vname];
       append from Rt;
       close simul7B;
quit;
