 ODS EXCLUDE FISHERSEXACT;
ODS TRACE
ODS
 ODS OUTPUT
nameoftable=outputdataset
 ;
 ODS OUTPUT
nameoftable=outputdataset
 ;
 DATA NEW; SET
originaldataset
 ;
 IF :=1 THEN SET
outputdataset
 ;
 DATA NEW; SET
originaldataset
 ;
 IF :=1 THEN SET
outputdataset
 ;
