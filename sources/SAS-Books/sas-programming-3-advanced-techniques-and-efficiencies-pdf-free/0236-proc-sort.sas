proc sort data=orion.order_fact(keep=Customer_ID Product_ID)
          out=order_fact;
   by Customer_ID;
run;
data temp;
   merge order_fact(in=O)
         orion.customer_dim(keep=Customer_ID Customer_Name
                            in=C);
   by Customer_ID;
   if O and C;
run;
proc sort data=temp;
   by Product_ID;
run;
data purchases;
   keep Customer_Name Product_Name Supplier_Name;
   merge temp(in=T)
         orion.product_dim(keep=Product_ID Product_Name
                                  Supplier_Name
                            In=P);
   by Product_ID;
   if P and T;
run;
proc print data=purchases(obs=5);
   title 'Partial purchases Data Set';
run;
