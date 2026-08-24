%let ss = 12; /*sample size*/
%let nrp =1000; /*Number of replications*/
proc iml;
       call randseed(12345);
       use aspx_ret;/*Same data set as SURVEY S
       read all var {'Date' 'Price' 'mret' 'Blo
       close;
       n=nrow(mret);
       ss=&ss;
       m=n/ss;
       ys=shape(mret,m,ss);
       sid = sample(1:nrow(ys), &nrp);
       yb=sid'||ys[sid,];/*include sid to show
       ybc=ys[sid,];
       smean=(mean(ybc'))';/*Calculate mean of
       ssd =((std(smean)))/sqrt(&nrp);/*Calcula
       bsmean=mean(smean); /*Mean of means calc
       create bootsamp3 from yb;
       append from yb;
       close bootsamp;
       create bootstats3 from smean;
       append from smean;
       close bootstats3;
       print ("Block Bootstrapping Using PROC I
       colnames = "obs1":"obs12";
       print (yb[1:2,1])[label='Block ID']  (yb
       print ("Descriptive Statistics");
       print (bsmean)[label='Mean'] (ssd) [labe
quit;
