data Standard;
   length Standard $ 13;
   input Phone $13.;
   Digits = compress(Phone,,'kd');
   Standard = cats('(',substr(Digits,1,3),')',substr(Digits,4,3),
'-',substr(Digits,7,4));
   drop Digits;
datalines;
(908)432-1234
800.343.1234
8882324444
(888)456-1324
;
