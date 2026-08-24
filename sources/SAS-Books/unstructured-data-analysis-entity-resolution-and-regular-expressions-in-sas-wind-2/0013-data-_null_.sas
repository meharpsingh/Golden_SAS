data _null_;
input text $50.;
   RegEx_ID=prxparse('/((Dog)|(Rat)|(Cat))/o');
   if prxmatch(RegEx_ID, text) then do;
          paren=prxparen(RegEx_ID);
          CALL PRXPOSN(RegEx_ID, paren, position,
length);
          buffer = substr(text, position,
length);
          put 'I matched capture buffer ' paren
'with ' buffer;
          end;
if paren=2 then put 'I love dogs!';
else put 'I cannot stand a ' buffer'!';
datalines;


;
