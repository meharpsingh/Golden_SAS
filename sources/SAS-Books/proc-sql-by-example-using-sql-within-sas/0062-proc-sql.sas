PROC SQL;
SELECT       LOWCASE(name) AS name
FROM         sashelp.class
WHERE        CALCULATED name='jane';
;
QUIT;
