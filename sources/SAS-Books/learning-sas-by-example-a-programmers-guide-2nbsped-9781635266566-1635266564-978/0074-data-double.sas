  data Double;
Interest = .0375;
Total = 100;
do Year = 1 to 100 until (Total gt 200);
Total = Total + Interest*Total;
output;
end;
format Total dollar10.2;
  run;
