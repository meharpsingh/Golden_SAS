data CustomerCDR
     Customer(keep= CustID BirthDate Gender Tariff)
     CDR(keep = CustID Date Duration NumberOfCalls Amount);
