PROC SQL;
SELECT       LOWCASE(name) AS name
FROM         sashelp.class
WHERE        name='jane';
;
QUIT;
