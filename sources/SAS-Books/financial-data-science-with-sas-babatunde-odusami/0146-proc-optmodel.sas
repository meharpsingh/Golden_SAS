PROC OPTMODEL
/*Maximizing Portfolio Return in the Mean-Varia
%datapull(portret,portfolio_returns.sas7bdat);
%datapull(portvcv,portfolio_covariances.sas7bda
%let max_risk = 0.045;
%let alpha=0.99;
%let rfr=0.00178;
proc optmodel;
       /* declare sets and parameters */
       set <str> ASSETS;
       num returns {ASSETS};
       num covariance {ASSETS, ASSETS};
       /* read portfolio data from SAS data set
       read data Portfolio_Returns into ASSETS=
       *print returns;
       read data Portfolio_Covariances into [Ti
               {j in ASSETS} <covariance[Ticker
       *print covariance;
       /* declare variables */
       var Weights {ASSETS} >= 0;
