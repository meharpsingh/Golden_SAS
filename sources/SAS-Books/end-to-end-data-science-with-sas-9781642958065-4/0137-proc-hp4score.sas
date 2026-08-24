PROC HP4SCORE DATA=mydata.bank_test;
  ID ROW_NUM;
  SCORE FILE = 'C:/Users/James Gearheart/Desktop/SAS Book Stuff/Data/bank_RF.bin'
  OUT = RF_SCORED;
RUN;
