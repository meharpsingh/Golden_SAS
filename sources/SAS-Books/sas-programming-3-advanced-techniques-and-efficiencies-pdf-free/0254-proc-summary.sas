proc summary data=orion.customer_dim;
   var Customer_Age;
   output out=average mean=AvgAge;
run;
data age_dif;
   if _N_=1 then set average(keep=AvgAge);
   set orion.customer_dim(keep=Customer_ID Customer_Age);
   Age_Difference=Customer_Age - AvgAge;
run;
