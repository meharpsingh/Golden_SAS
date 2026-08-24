  data Truncate;
input Age Weight Cost;
Age = int(Age);
WtKg = round(Weight/2.2, .1);
Weight = round(Weight);
Next_Dollar = Ceil(Cost);
  datalines;
  18.8 100.7 98.25
  25.12 122.4 5.99
  64.99 188 .0001
  ;
