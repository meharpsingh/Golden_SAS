ods graphics / attrpriority=none;
proc sgplot data=mydata.bank_train (where=(pdays ne 999));
styleattrs datasymbols=(circlefilled trianglefilled) ;
       scatter x=pdays y=age / group=target;
       title 'Scatter Plot of Bank Marketing Data';
run;
