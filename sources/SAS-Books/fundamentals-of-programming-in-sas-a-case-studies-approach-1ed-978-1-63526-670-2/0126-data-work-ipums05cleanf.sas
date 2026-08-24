data work.IPUMS05CleanF;
  infile RawData('IPUMS2005Dirtied.dat) dlm='09'x dsd;
  input Serial $ CityPop : comma. Metro CountyFips Ownership : $50.
        MortgageStatus : $50. HHIncome : comma. HomeValue : comma.
        City : $50. MortgagePaymentC : $20.;
  City=compbl(City);
  Ownership=propcase(Ownership);
  MortgageStatus=tranwrd(tranwrd(MortgageStatus,'\','/'),'-','/ ');
  MortgagePaymentC=tranwrd(MortgagePaymentC,'O','0') ;
  MortgagePayment=abs(input(MortgagePaymentC,dollar20.)) ;
  format hhIncome homeValue mortgagePayment dollar16.;
run;
proc means data= work.IPUMS05CleanF n nmiss min median max maxdec=1;
  var mortgagePayment;
run;   Since the initial read of MortgagePayment is character, TRANWRD can be used to swap the zero in for the incorrect characters.
