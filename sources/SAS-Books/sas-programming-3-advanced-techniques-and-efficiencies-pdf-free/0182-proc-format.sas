proc format;
picture paren low - high='(999)999-9999';
picture nospace low-high='999)999-9999'
(prefix= '(' );
picture space low-high=' 999)999-9999'
(prefix= '(' );
run;
