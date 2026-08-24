options fullstimer;
data _null_;
   length var $ 30;
   retain var2-var50 0 var51-var100 'ABC';
   do x=1 to 10000000;
      var1=10000000*ranuni(x);
      if var1>1000000 then var='Greater than 1,000,000';
      if 500000<=var1<=1000000
         then var='Between 500,000 and 1,000,000';
      if 100000<=var1<500000 then var='Between 100,000 and 500,000';
      if 10000<=var1<100000 then var='Between 10,000 and 100,000';
      if 1000<=var1<10000 then var='Between 1,000 and 10,000';
      if var1<1000 then var='Less than 1,000';
   end;
run;
