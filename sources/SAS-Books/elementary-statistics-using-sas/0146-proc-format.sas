options nodate nonumber ps=60 ls=80;
proc format;
   value $subtxt
         'speced' = 'Special Ed'
         'mathem' = 'Mathematics'
         'langua' = 'Language'
         'music'  = 'Music'
         'scienc' = 'Science'
         'socsci' = 'Social Science';
run;
