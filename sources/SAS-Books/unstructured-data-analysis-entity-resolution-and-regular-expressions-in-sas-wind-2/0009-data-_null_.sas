data _null_;
   RegEx_ID=prxparse('/\b((Dog)|(Rat)|
(Cat))\b/o');
   position=prxmatch(RegEx_ID, 'The Cat in the
Hat');
   if position then paren=prxparen(RegEx_ID);
          put 'I matched capture buffer ' paren;
   position=prxmatch(RegEx_ID, 'The Rat in the
Hat');
   if position then paren=prxparen(RegEx_ID);
          put 'I matched capture buffer ' paren;
   position=prxmatch(RegEx_ID, 'The Dog on the
Roof');
   if position then paren=prxparen(RegEx_ID);
          put 'I matched capture buffer ' paren;
run;
