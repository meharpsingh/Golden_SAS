%macro capsimul(nrep); /*specify number of reps*/
       proc datasets nodetails nolist;
               delete simul11;
       run;
       %local  i nrep; /*local macro variable*/
       %do i=1 %to &nrep;
/******Reused Same Code from Program 4.14****/
data pinfo;
QTY = 12000 *(1+rand("normal",0,0.1)) ;/*simulating quantity sold
run;
proc computab data=pinfo out=capbud2 noprint;
/****Reused Code Ends Here***/
       /*Merge project info data with cap budgeting results*/
       data _simul_;
               merge pinfo(keep=QTY) capbud2(obs=1 keep=NPV IRR);
               sampleID=&i;
       label QTY= 'Quantity Sold' NPV='Net Present Value' IRR='In
               format NPV nlmny16.2 QTY best10.2 IRR percent8.2;
       run;
       /*updated table with results from new iteration*/
       proc append base=simul11 data=_simul_ force;
       run;
%end;
%mend;
/*Macro invoked to do 1000 repetitions*/
%capsimul(1000);
proc tabulate data=simul11;
       var qty npv irr;
       table qty*F=bestn10.2 npv*F=dollar15.2 irr*F=percent8.2,(m
       p10 );
run;
