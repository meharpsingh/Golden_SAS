data _null_;
   set Clean.Patients(keep=Patno Dx);  ➊
   length First_Three Last_Three $ 3 Period $ 1; ➋
   First_Three = Dx;   ➌
   Period = substr(Dx,4,1); ➍
   Last_Three = substr(Dx,5,3); ➎
   file print; ➏
   if missing(Dx) then put
      "Missing Dx for patient " Patno; ➐
   else if notdigit(First_Three) or Period ne '.' or notdigit(Last_Three)
      then put "Invalid Dx " Dx "for patient " Patno;
run;
