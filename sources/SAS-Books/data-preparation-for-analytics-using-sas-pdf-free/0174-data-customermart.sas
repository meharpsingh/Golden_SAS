DATA CustomerMart;
 MERGE Customer (IN = InCustomer)
       UsageMart (IN = InUsageMart);
 BY CustID;
 IF InCustomer;
RUN;
