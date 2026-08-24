proc format;
   value $gender
        'F'='Female'
        'M'='Male'
      other='Invalid code';
   value salrange
                  .='Missing salary'
      20000-<100000='Below $100,000'
      100000-500000='$100,000 or more'
              other='Invalid salary';
run;
