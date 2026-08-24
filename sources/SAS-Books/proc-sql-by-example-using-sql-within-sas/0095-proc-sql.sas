PROC SQL;
CREATE TABLE classgirls AS
SELECT       *
FROM         sashelp.class(RENAME=(name=FName) )
WHERE        sex='F'
;
QUIT;
