data work.IPUMS05CleanB;
  infile RawData('IPUMS2005Dirtied.dat) dlm='09'x dsd;
  input Serial $ CityPop : comma. Metro CountyFips Ownership : $50.
        MortgageStatus : $50. HHIncome : comma. HomeValue : comma.
        City : $50. MortgagePayment : comma.;
  City=compbl(City);
  format hhIncome homeValue mortgagePayment dollar16.;
run;
ods exclude all;
proc freq data= work.IPUMS05CleanB;
  table city;
  ods output onewayfreqs= work.freqs;
run;
ods exclude none;
proc print data= work.freqs(obs=10) label noobs;
  var city--cumPercent;
run;
