%let smean=0.0067658;/*Mean Return*/
%let ssd = 0.04465726;/*Standard Deviation of Returns*/
%let inprice=3756.07; /*Initial Index Level*/
data simul8;
       format Date monyy.;
       keep Date Fmret Sumret Price;
       call streaminit(4321);
       InitDate = '2Jan2021'd;
       Sumret=&smean-&ssd *0.5;
       do iter=1 to 24; /*number of replication*/
               Date=intnx('month',InitDate,dt,'end');/*Simulating
               Fmret =rand("normal",&smean,&ssd);/*Simulating Mon
               Sumret =sumret+fmret; /*Cumulating the returns*/
               Price =&inprice*exp(sumret);/*Continuously compoun
               dt+1;
               output;
       end;
       label
              Fmret='Simulated Monthly Returns'
              Price = 'Simulated Monthly Index Level'
              Sumret = 'Cumulative Monthly Returns';
run;
