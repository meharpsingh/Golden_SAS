PROC SQL;
SELECT       name, type
FROM         DICTIONARY.COLUMNS
WHERE        libname  = 'WORK' AND
             memname  = 'WIDE'
;
QUIT;
