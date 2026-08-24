proc sort data=orion.customer(keep=Customer_ID Birth_Date
                                    Customer_Name)
          out=customer;
   by descending Birth_Date;
run;
data age_groups;
   keep Customer_ID Customer_Name Age Description;
   set customer;
   Age=int(yrdif(Birth_Date, '01Jan2008'd, 'ACT/ACT'));
   do while (not (First_Age le Age lt Last_Age));
     set orion.ages_mod;
   end;
run;
