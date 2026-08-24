/* Merged listing: this program was assembled from 2 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0123-data-work-ipums05cleand.sas --- */
data work.IPUMS05CleanD;
  infile RawData('IPUMS2005Dirtied.dat) dlm='09'x dsd;
  input Serial $ CityPop : comma. Metro CountyFips Ownership : $50.
        MortgageStatus : $50. HHIncome : comma. HomeValue : comma.
        City : $50. MortgagePayment : comma.;
  City=compbl(City);
  Ownership=propcase(Ownership);
  MortgageStatus=tranwrd(tranwrd (MortgageStatus,'\','/' ),'-','/ ' );
  format hhIncome homeValue mortgagePayment dollar16.;

/* --- 0124-proc-freq.sas --- */
proc freq data= work.IPUMS05CleanD;
  table MortgageStatus;
run;
