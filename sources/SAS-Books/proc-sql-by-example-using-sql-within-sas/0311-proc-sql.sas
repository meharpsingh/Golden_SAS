PROC SQL;
SELECT       name, age
FROM         sashelp.class
WHERE        sex='F'
UNION
SELECT       name, age + 1
FROM         sashelp.class
ORDER BY     age
;
QUIT;
