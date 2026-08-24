proc summary data=macro3.clinics;
   class sex;
   var ht wt;
   output out=summry
          n= n_ht weight_n
          mean= mHT Mean_wt;
   run;
