proc format;
  value MetroB
    0 = "Not Identifiable"
    1 = "Not in Metro Area"
    other = "In a Metro Area"
  ;
  value $MortStatus
    'No'-'Nz'='No'
    'Yes'-'Yz'='Yes'
  ;
  value Hvalue
    0-65000='$65,000 and Below'
    65000<-110000='$65,001 to $110,000'
    110000<-225000='$110,001 to $225,000'
    225000<-500000='$225,001 to $500,000'
    500000-high='Above $500,000'
  ;
run;
