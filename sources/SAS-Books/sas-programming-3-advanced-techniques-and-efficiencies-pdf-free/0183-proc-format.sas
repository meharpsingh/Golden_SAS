proc format;
picture longdate (default=30)
'01jan1950'd-'31dec2004'd='%A, %B %d'
(datatype=date);
picture noleadz
'01jan1950'd-'31dec2004'd='%y~%m~%d'
(datatype=date);
picture leadzero
'01jan1950'd-'31dec2004'd='%0y~%0m~%0d'
(datatype=date);
run;
