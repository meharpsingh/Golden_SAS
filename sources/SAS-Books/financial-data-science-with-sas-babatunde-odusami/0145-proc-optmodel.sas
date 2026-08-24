proc optmodel;
       /* declare sets and parameters */
       set <num> FUND;
       set <str> FACTOR={'MRP', 'SMB', 'HML','RM
       num Preturns {FUND};
       num Factors{FUND,FACTOR};
       /* read portfolio data from SAS data sets
       read data Constrained into FUND=[Date] PR
       *read data Constrained into FACTORS=[Mont
       read data Constrained into [Date]
               {j in FACTOR} <Factors[Date,j]=co
       /* declare variables */
       var Weights{FACTOR} >= 0;
       /*Calculate Portfolio Risk Measures*/
      impvar TE{i in FUND}=sum{j in FACTOR}(pret
       /* declare constraints */
       con Factor_Weights: sum {j in FACTOR} Wei
       /* declare objective */
       min Fund_Factor = sum{i in FUND}TE[i];
       solve with QP;
       print Weights;
       /* write data to SAS data sets */
       create data factweight from [Factors]={j
               Weights=Weights;
      create data RSquarecal from [date]={i in F
quit;
/*Use PROC IML to compute R-Square*/
proc iml;
       use Rsquarecal;
       read  all into RR[colname=NumerNames];
       CR=RR[,2:3];
       VCV=cov(CR);
       print VCV;
       RSquare=1-VCV[1,1]/VCV[2,2];
       print RSquare[ format=percent8.2];
quit;
