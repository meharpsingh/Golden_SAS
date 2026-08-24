DATA _NULL_;
 years_yrdiff = YRDIF('16MAY1970'd,'22OCT2006'd,'ACTUAL');
 years_divide = ('22OCT2006'd - '16MAY1970'd) / 365.2242;
 output;
 PUT years_yrdiff= years_divide=;
