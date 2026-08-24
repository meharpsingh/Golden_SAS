data _null_;
   file print;
   input @1  Patno $3.
         @4  HR $3.
         @7  SBP $3.
         @10 DBP $3.;
   X = input(HR,3.);
   if _error_ then do;
      put "Invalid value " HR "for HR in patient " Patno;
      _error_ = 0;
   end;
   X = input(SBP,3.);
   if _error_ then do;
      put "Invalid value " SBP "for SBP in patient " Patno;
      _error_ = 0;
   end;
   X = input(DBP,3.);
   if _error_ then do;
      put "Invalid value " DBP "for DBP in patient " Patno;
      _error_ = 0;
   end;
datalines;
001080140 90
0029.0180 90
003abcdefghi
00490x120100


005       80
;
