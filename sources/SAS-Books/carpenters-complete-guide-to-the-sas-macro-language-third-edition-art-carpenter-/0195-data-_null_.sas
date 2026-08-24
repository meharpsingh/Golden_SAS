data _null_;
   x=5;
   store = '    A&P'; ➋
   citystate = '   Seattle, WA'; ➌
   call symput('five',x); ➊
   call symputx('store',store); ➋
   call symputx('cs',citystate); ➌
   run;
%put  Unjustified |&five|;
%put Left Justified |%left(&five)|;
