%let N=364;
%let sigma=2.412801;
%let mu=13.8262;
%let beta=0.97559;
proc iml;
       xj= j(&n,1,.); /*vector random variables*/
       Volt=j(&n,1,0); /*Interest rate vector*/
       Vol=j(&n,2,&mu); /*Vector to merge simulate rates and date
       InitDate = '1jan2021'd; /*Initial Date*/
       call randseed(4321);
       call randgen(xj,"Normal");
       Volt=&mu+&beta*lag(Volt)+&sigma*xj;
       Vol[,2]=Volt;
       dt=0;
       do i = 1 to &n;
               dt=dt+1;
               Vol[i,1]=intnx('day',InitDate,dt);/*Simulating Dat
       end;
       vname ={"Date" "VIX"}; /*specify column and row label*/
       create simul9B from Vol[colname=vname];
       append from Vol;
       close simul9B;
quit;
