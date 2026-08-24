data _null_;
   call symputx('hascall', 'NOTE: Call macro %doit');
   call symputx('call2',   'NOTE: Call macro %doit');
   run;
%put &hascall; ➊
%put %superq(hascall); ➋
