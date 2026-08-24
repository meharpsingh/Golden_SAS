%let rfr=0.00178;/*Risk-Free Rate*/
%let alpha=0.99;/*VaR Threshold*/
%let tau=0.05;/*Weight of active risk*/
%let max_risk = 0.045;
/* Use PROC IML to set reverse optimization obt
proc iml;
       /*read subjective views (asset and retur
       use PMatrix; /*asset with subjective vie
       read  all var _NUM_ into p [colname=Nume
       use qret; /*subjective performances*/
       read all var _all_ into q[colname=NumerN
       use omega; /*Confidence level of views*/
       read all var _all_ into omega[colname=Nu
       *print p q;
       /* Read equilibrium returns and covarian
       use Portfolio_Returns;
       read all var _num_ into eqret[colname=Nu
       read all var _char_ into assets[colname=
       *print eqret;
       use Portfolio_Covariances;
       read all var _num_ into sigma[colname=Nu
       *print sigma;
       /*Compute revised expected returns and c
       RReturns=inv(inv(&tau*sigma)+t(p)*(inv(o
       RCovariances=sigma+inv(inv(&tau*sigma)+t
       *print RReturns[colname='Returns'];
       *print RCovariances[colname=Name rowname
       /*Export revised expected returns into S
       Anames ='Ticker'||'Returns'||'EQReturns'
       create Revised_Portfolio_Returns from As
       append from Assets RReturns Eqret;
       close Revised_Portfolio_Returns;
       /*Export revised covariance into SAS dat
       sname ={'Assets'};/*Variable names setup
       cnames ='Ticker'||Numernames;
       *print cnames;
       create Revised_Porfolio_Covariances from
       append from Assets RCovariances;
       close Revised_Porfolio_Covariances;
