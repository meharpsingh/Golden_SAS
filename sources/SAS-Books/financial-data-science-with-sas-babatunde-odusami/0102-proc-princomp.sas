ods graphics on;
proc princomp data  = spx_profit standard
out=pcscores(label="original data and principal components scores f
outstat=pcstats(label="principal components statistics for work.spx
       prefix='comp#'n            vardef=df
       plots(only)=scree
       plots(only)=matrix
       plots(only)=patternprofile
       plots(only)=pattern ;
       var logrev logmcap logemp logshrout age beta esg pct_wboard
run;
