%let n=63;
proc iml;
       /* Read asset returns and covariances in
       use Portfolio_Returns;
       read all var _num_ into returns[colname=
       read all var _char_ into assets[colname=
       use Portfolio_Covariances;
       read all var _num_ into sigma[colname=Nu
       rfr=0.00178;/*Monthly Risk-free rate*/
       start max_sharpe(w) global(rfr,sigma,ret
      sharpe);
               portfolio_return=W*returns;
               portfolio_risk=sqrt(w*sigma*t(w)
               sharpe=(portfolio_return-rfr)/po
               return (sharpe);
       finish;
       /*Constraint: lower bound, upper bound,
       p={0,1,1};
       con=repeat(p,1,&n)||{. .,. .,0 1};
       /* Setting the optimization to maximize
       optn={1 1};
       /*Invoke non-linear Quasi Newton for the
       w=j(1,&n,1/&n);
       call NLPQN(rc,OptW,"max_sharpe",w,optn,c
       /* Print Optimization Output*/
       print portfolio_return[format=percent8.2
       TOptW=t(OptW);
       ind = loc(TOptw>0);
       if ncol(ind)>0 then
               rn=NumerNames[ind];
       Weights=TOptW[ind];
       print Weights[format=percent8.2 l='Portf
       cnames='Ticker'||'Weights';
